module Main

import CommandLine
import Data.String
import Data.List1
import Generator.Idris2
import Generator.C
import Parser.Native
import Parser.Common

defaultsIdris : IdrisOpts
defaultsIdris = MkIdrOpts False "src/Sys/Clang.idr" "Sys.Clang" "wrapper" "libclang"

defaultsC : ClangOpts
defaultsC = MkClangOpts False "sys/wrapper.c" (LibraryName "clang-c/Index.h")

moduleToFilepath : String -> String
moduleToFilepath str = "src/" ++ (joinBy "/" (forget (split (== '.') str))) ++ ".idr"

parseIdrOpts : List CliOpt -> IdrisOpts -> IdrisOpts
parseIdrOpts [] opts = opts
parseIdrOpts ((WrapperName str) :: xs) opts = parseIdrOpts xs ({ wrapperName := str } opts)
parseIdrOpts ((ModuleName str) :: xs) opts = parseIdrOpts xs ({ moduleName := str, fileName := moduleToFilepath str } opts)
parseIdrOpts (NativeEnumConversion :: xs) opts = parseIdrOpts xs ({ enumConversion := True } opts)
parseIdrOpts (_ :: xs) opts = parseIdrOpts xs opts

parseClangOpts : List CliOpt -> ClangOpts -> ClangOpts
parseClangOpts [] opts = opts
parseClangOpts ((WrapperName str) :: xs) opts = parseClangOpts xs ({ fileName := (str ++ ".c") } opts)
parseClangOpts ((InputFile str) :: xs) opts = parseClangOpts xs ({ clibLoc := FilePath str } opts)
parseClangOpts (NativeEnumConversion :: xs) opts = parseClangOpts xs ({ enumConversion := True } opts)
parseClangOpts (_ :: xs) opts = parseClangOpts xs opts

getInputFile : List CliOpt -> Either () String
getInputFile [] = Left ()
getInputFile ((InputFile str) :: xs) = Right str
getInputFile (_ :: xs) = getInputFile xs

main : IO ()
main =
  do Right cliOpts <- getCmdOpts
       | Left err => printLn err
     let Right input = getInputFile cliOpts
       | Left err => printLn "No input given"
     let idrOpts : IdrisOpts = parseIdrOpts cliOpts defaultsIdris
     let clangOpts : ClangOpts = parseClangOpts cliOpts defaultsC
     Right ast <- parseAST input
       | Left err => printLn err
     generateIdris idrOpts ast
     generateC clangOpts ast
     printLn "No crash!"
