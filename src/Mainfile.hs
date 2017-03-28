module Main where

import LexM
import ParM
import AbsM
import AST 
import ASTConv
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
        Ok rpTree -> do 
            let 
               ast = transProg rpTree
            pp ast
        Bad s -> error $ "Error in parsing: " ++ s 
    
