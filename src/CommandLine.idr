module CommandLine

import System

-- Adapted from Idris2's src/Idris/CommandLine.idr

public export
data CliOpt
  = InputFile String
  | WrapperName String
  | ModuleName String
  | NativeEnumConversion
  | VerboseLogging


data OptType
  = Required String

Show OptType where
  show (Required a) = "<" ++ a ++ ">"

ActType : List OptType -> Type
ActType [] = List CliOpt
ActType (Required a :: as) = String -> ActType as

record OptDesc where
  constructor MkOpt
  flags : List String
  argdescs : List OptType
  action : ActType argdescs
  help : Maybe String


options : List OptDesc
options = [
            MkOpt ["--file", "-f"] [Required "file"] (\f => [InputFile f])
              (Just "Filepath of the C header to wrap"),
            --MkOpt ["--library", "-l"] [Required "file"] (\f => [InputLibrary f])
            --  (Just "Name of the C library to wrap"),
            MkOpt ["--wrapper", "-w"] [Required "file"] (\f => [WrapperName f])
              (Just "Name of the C glue output"),
            MkOpt ["--module", "-m"] [Required "module name"] (\n => [ModuleName n])
              (Just "Name of the generated Idris module"),
            MkOpt ["--native-enum-conversion", "--nec"] [] [NativeEnumConversion]
              (Just "Convert Idris enums to their C-equivalents using C glue."),
            MkOpt ["--verbose", "-v"] [] [VerboseLogging]
              (Just "Make log messages more verbose")
          ]


processArgs : String -> (args : List OptType) -> List String -> ActType args ->
              Either String (List CliOpt, List String)
processArgs flag [] xs f = Right (f, xs)
-- Missing required arguments
processArgs flag (opt@(Required _) :: as) [] f =
  Left $ "Missing required argument " ++ show opt ++ " for flag " ++ flag
-- Happy cases
processArgs flag (Required a :: as) (x :: xs) f =
  processArgs flag as xs (f x)


matchFlag : (d : OptDesc) -> List String ->
            Either String (Maybe (List CliOpt, List String))
matchFlag d [] = Right Nothing -- Nothing left to match
matchFlag d (x :: xs)
    = if x `elem` flags d
         then do args <- processArgs x (argdescs d) xs (action d)
                 Right (Just args)
         else Right Nothing


findMatch : List OptDesc -> List String ->
            Either String (List CliOpt, List String)
findMatch [] [] = Right ([], [])
findMatch [] (f :: args) = Right ([InputFile f], args)
findMatch (d :: ds) args
    = case !(matchFlag d args) of
           Nothing => findMatch ds args
           Just res => Right res


parseOpts : List OptDesc -> List String -> Either String (List CliOpt)
parseOpts opts [] = Right []
parseOpts opts args
   = do (cl, rest) <- findMatch opts args
        cls <- parseOpts opts rest
        pure (cl ++ cls)


export
getOpts : List String -> Either String (List CliOpt)
getOpts opts = parseOpts options opts


export
getCmdOpts : IO (Either String (List CliOpt))
getCmdOpts = do (_ :: opts) <- getArgs
                    | _ => pure (Left "Invalid command line")
                pure $ getOpts opts
