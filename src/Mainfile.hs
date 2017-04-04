module Main where

import LexM
import ParM
import AbsM
import AST
import ASTConv
import IR
import SymbolTable
import Text.PrettyPrint.GenericPretty
import ErrM -- to show

import System.Environment


isVarDec::M_decl -> Bool
isVarDec (M_var(_, _)) = True
isVarDec _ = False

isFunDec::M_decl -> Bool
isFunDec (M_fun(_, _, _, _)) = True
isFunDec _ = False





insertVars::[M_decl] -> ST -> Either String ST
insertVars [] st = st
insertVars (d:ds) st = case (insertDec d st) of
    Left str -> Left str
    Right newST -> insertDecs ds newST
    
insertVar::M_decl -> ST ->  Either String ST
insertVar M_var(str, type_) st = insert st (VARIABLE(str, type_))



--M_fun (String ,[(String, M_type)], M_type, M_prog)
insertFuncs::[M_decl] -> ST -> Either String ST
insertFuncs [] st = st
insertFuncs (d:ds) st = case (insertDec d st) of
    Left str -> Left str
    Right newST -> insertFunc ds newST
    
insertFunc::M_decl -> ST ->  Either String ST
insertFunc M_fun(str, args, retType, prog) st = x where
    (err, newST) = insert st (FUNCTION(str, map snd args, retType))
    





exprType::M_expr -> ST -> M_type
exprType expr st = case expr of
    M_num x -> M_num
    M_bl x  -> M_bl
    M_id s  -> t where (I_VARIABLE(_, _, t)) = look_up st s
    M_operation(op, expr1, expr2) -> case op of
        M_add -> (exprType expr1) == M_num && (exprType expr2) == M_num
        M_mul -> (exprType expr1) == M_num && (exprType expr2) == M_num
        M_sub -> (exprType expr1) == M_num && (exprType expr2) == M_num
        M_div -> (exprType expr1) == M_num && (exprType expr2) == M_num
        M_neg -> (exprType expr1) == M_num && (exprType expr2) == M_num
        M_lt  -> (exprType expr1) == M_num && (exprType expr2) == M_num
        M_le  -> (exprType expr1) == M_num && (exprType expr2) == M_num
        M_gt  -> (exprType expr1) == M_num && (exprType expr2) == M_num
        M_ge  -> (exprType expr1) == M_num && (exprType expr2) == M_num
        M_eq  -> (exprType expr1) == M_num && (exprType expr2) == M_num
        M_not -> (exprType expr1) == M_bl
        M_and -> (exprType expr1) == M_bl  && (exprType expr2) == M_bl
        M_or  -> (exprType expr1) == M_bl  && (exprType expr2) == M_bl
        M_fn x-> type_ where (I_FUNCTION(_,_,_, type_)) = look_up x st


stmtCheck::[M_stmt] -> ST -> Bool
stmtCheck (s:sl) st =  case s of
    (M_ass(str, expr)) -> (look_up str st) == (exprType expr st)
    (M_while(expr, stmt)) -> (exprType expr == Bool) && (stmtCheck stmt)
    (M_cond(expr, stmt1, stmt2)) -> (exprType expr == Bool) && (stmtCheck stmt1) && (stmtCheck stmt2)
    (M_read(str)) -> look_up str st
    (M_print(expr)) -> exprType == M_expr
    (M_return(expr)) -> exprType == M_expr
    (M_block(declList, stmtList) -> do
        new_scope st
        case (insertDecs declList (fst st)) of
            Left str -> do 
            putStrLn str
            False
        Right newST -> do
            stmtCheck stmtList newST
    



genIR::M_prog -> ST -> I_prog
genIR (M_prog (declList, stmtList)) st = p where
    varList = filter isVarDec decList
    funList = filter isFunDec decList
    (errV, vST) = insertVars varList st
    (errF, fST) = insertFuncs funList vST
    stmtCheck stmtList
                
            
    
    
    
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
                    --ir = genIR ast []
                pp ast
               
        Bad s -> error $ "Error in parsing: " ++ s 
    
