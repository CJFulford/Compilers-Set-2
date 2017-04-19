module Main where

import LexExpr
import ParExpr
import AbsExpr
import AST 
import ASTConv
import ErrM -- to show

import System.Environment

main = do
    args <- getArgs
    let fname = args !! 0
    fConts <- readFile fname
    let
        tokens = myLexer fConts
        pTree  = pExpr tokens
    case pTree of 
        Ok rpTree -> do 
            let 
               ast = transExpr rpTree
            putStrLn $ "\n\n" ++ show ast ++ "\n\n"
        Bad s -> error $ "Error in parsing: " ++ s 
    
