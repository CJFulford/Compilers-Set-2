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

isInt::M_type -> Bool
isInt M_int = True
isInt _ = False

isBool::M_type -> Bool
isBool M_bool = True
isBool _ = False


{-
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
    





exprType::M_expr -> ST -> Either String (M_type, I_expr)
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

-}

checkStmts::[M_stmt] -> ST -> Either String [I_stmt]
checkStmts [] st = Right []
checkStmts (stmt:stmts) st = case (checkStmt stmt st) of
    Left err    -> Left err
    Right iStmt -> case (checkStmts stmts) of
        Left err    -> Left error
        Right iStmts-> Right iStmt:iStmts

checkStmt::M_stmt -> ST -> Either String I_stmt
checkStmt stmt st =  case stmt of
    -- M_ass    (String, M_expr)
    -- I_ass    (Int,Int,I_expr)
    (M_ass(str, expr)) -> do
        let
            (I_VARIABLE(level, offset, strType)) = look_up str st
        in
        case (exprType expr st) of
            Left err            -> Left err
            Right (eType, iExpr)-> do
                if (strType == eType)
                then Right I_ass(level, offset, iExpr)
                else Left ("Illegal assignment. Expected " ++ strType ++ " recieved " ++ eType)
    -- M_while   (M_expr, M_stmt)
    -- I_while   (I_expr,I_stmt)
    (M_while(expr, stmt)) -> 
        case (exprType expr st) of
            Left err            -> Left err
            Right (eType, iExpr)-> do
                if (isBool eType)
                then case (checkStmt stmt) of
                    Left err    -> Left err
                    Right iStmt -> I_while(iExpr, iStmt)
                else Left ("Illegal Expression. Boolean expected")
    -- M_cond    (M_expr, M_stmt, M_stmt)
    -- I_cond    (I_expr,I_stmt,I_stmt)
    (M_cond(expr, stmt1, stmt2)) -> 
        case (exprType expr st) of
                Left err            -> Left err
                Right (eType, iExpr)-> do
                    if (isBool eType)
                    then case (checkStmt stmt1 st) of
                        Left err     -> Left err
                        Right iStmt1 -> case (checkStmt stmt2 st) of
                            Left err    -> Left err
                            Right iStmt2-> I_cond(iExpr, iStmt1, iStmt2)
                    else Left ("Illegal Expression. Boolean expected")
    -- M_read    String
    -- I_read_I  (Int,Int)
    -- I_read_B  (Int,Int)
    (M_read(str)) -> 
        let 
            (I_VARIABLE(level, offset, strType)) = look_up str st
        in
        if (isInt strType) -- only 2 types int and bool
        then I_read_I (level, offset)
        else I_read_B (level, offset)
    -- M_print   M_expr
    -- I_print_I I_expr
    -- I_print_B I_expr
    (M_print(str)) -> 
        let 
            (I_VARIABLE(level, offset, strType)) = look_up str st
        in
        if (isInt strType) -- only 2 types int and bool
        then I_print_I (level, offset)
        else I_print_B (level, offset)
    -- M_return  M_expr
    -- I_return  I_expr
    (M_return(expr)) -> 
        case (exprType expr st) of
            Left err             -> Left err
            Right (eType, iExpr) -> Right I_return(iExpr)
    -- M_block   ([M_decl], [M_stmt])
    -- I_block   ([I_fbody],Int,[I_stmt])
    (M_block(declList, stmtList)) ->
        let
            varList = filter isVarDec decList
            funList = filter isFunDec decList
        in
        case (insertVars varList (new_scope st)) of 
        Left err -> Left err
        Right st' -> case (insertFuncs funList st') of
            Left err -> Left err
            Right st'' ->  Right I_block(checkFuncs funList st'', length varList, checkStmts stmtList st'')


-- M_prog ([M_decl], [M_stmt])
-- I_prog ([I_fbody],Int,[I_stmt])
genIR::M_prog -> ST -> Either String I_prog
genIR (M_prog (declList, stmtList)) st = p where
    let
        varList = filter isVarDec decList
        funList = filter isFunDec decList
    in
    case (insertVars varList st) of 
    Left err -> Left err
    Right st' -> case (insertFuncs funList st') of
        Left err -> Left err
        Right st'' ->  Right I_prog(checkFuncs funList st'', length varList, checkStmts stmtList st'')

      
    
    
    
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
    
