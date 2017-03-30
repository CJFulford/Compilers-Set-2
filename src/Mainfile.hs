module Main where

import LexM
import ParM
import AbsM
import AST 
import ASTConv
--import SymbolTable
import Text.PrettyPrint.GenericPretty
import ErrM -- to show

import System.Environment

{-
typeCheck::M_prog -> M_prog
typeCheck M_prog (declList, stmtList) = p where
	table::ST = []
	map insert declList
-}
main = do
    args <- getArgs
    let fname = args !! 0
    fConts <- readFile fname
    let
        tokens = myLexer fConts
        pTree  = pProg tokens
    case pTree of 
        Ok rpTree -> do 
            pp (transProg rpTree)
               
        Bad s -> error $ "Error in parsing: " ++ s 
    
