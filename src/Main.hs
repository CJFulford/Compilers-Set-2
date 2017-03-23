module Main where

import LexM
import ParM
import AbsM
import SkelM
import AST 
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
            putStrLn $ "\n\n" ++ show ast  ++ "\n\n"
        Bad s -> error $ "Error in parsing: " ++ s 
    
