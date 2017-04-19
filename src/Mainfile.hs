module Main where

import LexM
import ParM
import AbsM
import ASTConv
import TypeCheck
import StackConv
import Text.PrettyPrint.GenericPretty
import ErrM -- to show

import System.Environment


main = do
    args <- getArgs
    let fname = args !! 0
    fConts <- readFile fname
    let
        tokens = myLexer fConts
        pTree  = pProg tokens
    case pTree of 
        Ok rpTree ->
                let
                    ast = transProg rpTree
                in
                case (genIR ast) of
                    Left err -> putStrLn err
                    Right ir -> pp ir
                
               
        Bad s -> error $ "Error in parsing: " ++ s 
    
