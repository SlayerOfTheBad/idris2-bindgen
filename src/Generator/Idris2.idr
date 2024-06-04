module Generator.Idris2

import Data.String
import Data.List1
import System.File
import System.Directory
import Parser.Common
import Generator.Common

public export
record IdrisOpts where
  constructor MkIdrOpts
  enumConversion : Bool
  fileName : String
  moduleName : String
  wrapperName : String
  clibName : String
%name IdrisOpts opts

writeHeader : HasIO io => (opts : IdrisOpts) -> (file : File) -> io (Either FileError ())
writeHeader opts file =
  fPutStrLn file """
    module \{opts.moduleName}

    import Data.Bits
    import System

    clib : String -> String
    clib str = "C:" ++ str ++ ",\{opts.clibName}"

    wrapper : String -> String
    wrapper str = "C:" ++ str ++ ",\{opts.wrapperName}"

    """

dirFromPath : String -> String
dirFromPath str = (joinBy "/" (init (split (== '/') str)))

namespace Enum
  Interpolation EnumSize where
    interpolate One = "Bits8"
    interpolate Two = "Bits16"
    interpolate Four = "Bits32"
    interpolate Eight = "Bits64"
    interpolate Other = "Int"

  toPrimitiveName : String
  toPrimitiveName = "toPrimitive"

  fromPrimitiveName : String
  fromPrimitiveName = "fromPrimitive"

  prelude : String -> EnumSize -> String
  prelude name size = """
    namespace \{name}
      public export
      \{primitiveEnumName name} : Type
      \{primitiveEnumName name} = \{size}

    """

  enumDefinition : String -> List EnumVariant -> String
  enumDefinition _ []  = ""
  enumDefinition name variants = """
      public export
      data \{name}
        = Other \{primitiveEnumName name}
    \{generateVariants variants}
    """
    where
      generateVariants : (variants : List EnumVariant) -> String
      generateVariants [] = ""
      generateVariants ((name, _) :: variants) = """
            | \{name}
        \{generateVariants variants}
        """

  toPrimitive : String -> String -> String
  toPrimitive name cases = """
      export
      Cast \{name} \{primitiveEnumName name} where
    \{cases}

      export
      toPrimitive : \{name} -> \{primitiveEnumName name}
      toPrimitive x = cast x
    """

  fromPrimitive : String -> String -> String
  fromPrimitive name cases = """
      export
      Cast \{primitiveEnumName name} \{name} where
    \{cases}

      export
      fromPrimitive : \{primitiveEnumName name} -> \{name}
      fromPrimitive x = cast x
    """

  fastCast : String -> List EnumVariant -> String
  fastCast name variants = """
  \{toPrimitive name $ toPrimitiveCases variants}

  \{fromPrimitive name $ fromPrimitiveCases variants}

  """
    where
      fromPrimitiveCases : List EnumVariant -> String
      fromPrimitiveCases [] = "    cast m = (Other m)\n"
      fromPrimitiveCases ((name, value) :: variants) = """
            cast (\{show value}) = \{name}
        \{fromPrimitiveCases variants}
        """
      toPrimitiveCases : List EnumVariant -> String
      toPrimitiveCases [] = "    cast (Other m) = m\n"
      toPrimitiveCases ((name, value) :: variants) = """
            cast \{name} = (\{show value})
        \{toPrimitiveCases variants}
        """

  nativeCast : String -> List EnumVariant -> String
  nativeCast enumName variants = """
    %foreign (clib "\{toPrimitiveEnumFunc enumName}")
    \{toPrimitiveEnumFunc enumName} : \{enumName} -> \{primitiveEnumName enumName}

  \{toPrimitive enumName $ toPrimitiveCases variants}

    %foreign (clib "\{fromPrimitiveEnumFunc enumName}")
    \{fromPrimitiveEnumFunc enumName} : \{primitiveEnumName enumName} -> \{enumName}

  \{fromPrimitive enumName $ fromPrimitiveCases variants}

  """
    where
      fromCases : List EnumVariant -> String
      fromCases [] = "      m => (Other m)"
      fromCases ((name, value) :: variants) = """
              (\{show value}) => \{name}
        \{fromCases variants}
        """
      fromPrimitiveCases : List EnumVariant ->  String
      fromPrimitiveCases variants = """
            cast x = case (\{toPrimitiveEnumFunc enumName} x) of
        \{fromCases variants}
        """
      toPrimitiveCases : List EnumVariant -> String
      toPrimitiveCases [] = "    cast (Other m) = m"
      toPrimitiveCases ((name, value) :: variants) = """
            cast \{name} = \{fromPrimitiveEnumFunc enumName} (\{show value})
        \{toPrimitiveCases variants}
        """

  generateConversions : String -> List EnumVariant -> Bool -> String
  generateConversions name variants False = fastCast name variants
  generateConversions name variants True = nativeCast name variants

  generateBitsInterface : String -> List EnumVariant -> EnumSize -> String
  generateBitsInterface name variants Other = ""
  generateBitsInterface name variants size = """
    export
    Bits \{name} where
      Index = Index @{the (Bits \{size}) %search}
      (.&.) x y = \{fromPrimitiveName} $ (\{toPrimitiveName} x) .&. (\{toPrimitiveName} y)
      (.|.) x y = \{fromPrimitiveName} $ (\{toPrimitiveName} x) .|. (\{toPrimitiveName} y)
      xor x y = \{fromPrimitiveName} $ xor (\{toPrimitiveName} x) (\{toPrimitiveName} y)
      shiftL x y = \{fromPrimitiveName} $ shiftL (\{toPrimitiveName} x) y
      shiftR x y = \{fromPrimitiveName} $ shiftR (\{toPrimitiveName} x) y
      zeroBits = \{fromPrimitiveName} $ zeroBits
      testBit = testBit . \{toPrimitiveName}
      bit = \{fromPrimitiveName} . bit

  """

  generateEqualsInterface : String -> String
  generateEqualsInterface name = """
    export
    Eq \{name} where
      (==) x y = (\{toPrimitiveName} x) == (\{toPrimitiveName} y)

  """

  export
  generateEnum : HasIO io => File -> IdrisOpts -> List EnumVariant -> String -> EnumSize -> io (Either FileError ())
  generateEnum _ _ [] _ _ = pure (Right ())
  generateEnum file opts variants name size =
    do Right _ <- write $ prelude name size
         | err => pure err
       Right _ <- write $ enumDefinition name variants
         | err => pure err
       Right _ <- write $ generateConversions name variants opts.enumConversion
         | err => pure err
       Right _ <- write $ generateBitsInterface name variants size
         | err => pure err
       Right _ <- write $ generateEqualsInterface name
         | err => pure err
       pure (Right ())
       where
         write : String -> io (Either FileError ())
         write str = fPutStrLn file str


generateCode : HasIO io => (opts : IdrisOpts) -> (file : File) -> (ast : AST) -> io (Either FileError ())
generateCode opts file [] = pure (Right ())
-- Anonimity only matters to C code
generateCode opts file ((Anonymous node) :: ast) = 
    generateCode opts file (node :: ast)
generateCode opts file ((Enum name size values) :: ast) =
    case !(generateEnum file opts values name size) of
      Right _ => generateCode opts file ast
      err     => pure err
-- We don't know anything about the internals of foward types
generateCode opts file ((Forward type name) :: ast) =
    fPutStrLn file """
      \{name} : Type
      \{name} = AnyPtr
      """

export
generateIdris : HasIO io => IdrisOpts -> AST -> io ()
generateIdris opts ast = 
  do 
     Right () <- createDir (dirFromPath opts.fileName)
       | Left err => putStrLn "Error creating path to \{opts.fileName}"
     Right file <- openFile opts.fileName WriteTruncate
       | Left err => putStrLn "Error opening \{opts.fileName}"
     Right _ <- writeHeader opts file
       | Left err => putStrLn "Error writing to \{opts.fileName}: \{show err}"
     Right _ <- generateCode opts file ast
       | Left err => putStrLn "Error writing to \{opts.fileName}: \{show err}"
     pure ()
