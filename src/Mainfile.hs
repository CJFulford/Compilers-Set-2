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


typeToString::M_type -> String
typeToString M_int = "Integer"
typeToString M_bool = "Boolean"

isVarDec::M_decl -> Bool
isVarDec (M_var(_, _)) = True
isVarDec _ = False

isFunDec::M_decl -> Bool
isFunDec (M_fun(_, _, _, _)) = True
isFunDec _ = False

isNum::M_type -> Bool
isNum M_int = True
isNum _ = False

isBool::M_type -> Bool
isBool M_bool = True
isBool _ = False

{-
data SYM_DESC = ARGUMENT (String,M_type)
              | VARIABLE (String,M_type)
              | FUNCTION (String,[M_type],M_type)
-}

-- M_var (String, M_type)
-- helper funtion for properly formating a list of vars declarations for insertion into the ST as arguments
insertArgs::[(String, M_type)] -> ST -> Either String ST
insertArgs [] st = Right st
insertArgs ((str, type_):args) st = case (insert st (ARGUMENT(str, type_))) of
    Left err  -> Left err
    Right st' -> 
        case (insertArgs args st') of
            Left err' -> Left err'
            Right st'' -> Right st''

-- M_var (String, M_type)
-- helper funtion for properly formating a list of var declarations for insertion into the ST as variables
insertVars::[M_decl] -> ST -> Either String ST
insertVars [] st = Right st
insertVars ((M_var(str, type_)):vars) st = case (insert st (VARIABLE(str, type_))) of
    Left err  -> Left err
    Right st' -> 
        case (insertVars vars st') of
            Left err' -> Left err'
            Right st'' -> Right st''

--M_fun (String ,[(String, M_type)], M_type, M_prog)
-- helper funtion for properly formating a list of Fun declarations for insertion into the ST as functions
insertFuncs::[M_decl] -> ST -> Either String ST
insertFuncs [] st = Right st
insertFuncs ((M_fun(str, args, retType, prog)):funcs) st = case (insert st (FUNCTION(str, map snd args, retType))) of
    Left err  -> Left err
    Right st' -> 
        case (insertFuncs funcs st') of
            Left err' -> Left err'
            Right st'' -> Right st''
    








    
checkExprs::[M_expr] -> ST -> Either String [(M_type, I_expr)]
checkExprs [] _ = Right []
checkExprs (e:es) st = case (checkExpr e st) of
    Left err ->  Left err 
    Right e' -> case (checkExprs es st) of
        Left err' -> Left err'
        Right es' -> Right (e':es')



checkExpr::M_expr -> ST -> Either String (M_type, I_expr)
checkExpr expr st = case expr of
    M_num int -> Right (M_int, I_num int)
    M_bl bool -> Right (M_bool, I_bool bool)
    M_id str  -> Right (eType, I_id(level, offset)) where I_VARIABLE(level, offset, eType) = look_up st str
    M_app (op, exprList) -> case op of
        M_fn str->
            let
                I_FUNCTION(level, label, args, retType) = look_up st str
            in
            case (checkExprs exprList st) of 
                Left err -> Left err
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (types == args)
                    then Right (retType, I_app(I_call(label, level), exprs))
                    else Left "Argument types dont match function parameters"
        M_add -> 
            case (checkExprs exprList st) of 
                Left err -> Left err
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (all (==True) (map (isNum) types))
                    then Right (M_int, I_app(I_add, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_sub -> 
            case (checkExprs exprList st) of 
                Left err -> Left err
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (all (==True) (map (isNum) types))
                    then Right (M_int, I_app(I_sub, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_mul -> 
            case (checkExprs exprList st) of 
                Left err -> Left err
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (all (==True) (map (isNum) types))
                    then Right (M_int, I_app(I_mul, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_div -> 
            case (checkExprs exprList st) of 
                Left err -> Left err
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (all (==True) (map (isNum) types))
                    then Right (M_int, I_app(I_div, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_neg -> 
            case (checkExprs exprList st) of 
                Left err -> Left err
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (all (==True) (map (isNum) types))
                    then Right (M_int, I_app(I_neg, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_lt -> 
            case (checkExprs exprList st) of 
                Left err -> Left err
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (all (==True) (map (isNum) types))
                    then Right (M_bool, I_app(I_lt, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_le -> 
            case (checkExprs exprList st) of 
                Left err -> Left err
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (all (==True) (map (isNum) types))
                    then Right (M_bool, I_app(I_le, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_gt -> 
            case (checkExprs exprList st) of 
                Left err -> Left err
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (all (==True) (map (isNum) types))
                    then Right (M_bool, I_app(I_gt, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_ge -> 
            case (checkExprs exprList st) of 
                Left err -> Left err
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (all (==True) (map (isNum) types))
                    then Right (M_bool, I_app(I_ge, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_eq -> 
            case (checkExprs exprList st) of 
                Left err -> Left err
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (all (==True) (map (isNum) types))
                    then Right (M_bool, I_app(I_eq, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_not -> 
            case (checkExprs exprList st) of 
                Left err -> Left err
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (all (==True) (map (isBool) types))
                    then Right (M_bool, I_app(I_not, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_and -> 
            case (checkExprs exprList st) of 
                Left err -> Left err
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (all (==True) (map (isBool) types))
                    then Right (M_bool, I_app(I_and, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_or -> 
            case (checkExprs exprList st) of 
                Left err -> Left err
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (all (==True) (map (isBool) types))
                    then Right (M_bool, I_app(I_or, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
                










checkStmts::[M_stmt] -> ST -> Either String [I_stmt]
checkStmts [] st = Right []
checkStmts (stmt:stmts) st = case (checkStmt stmt st) of
    Left err    -> Left err
    Right iStmt -> 
        case (checkStmts stmts st) of
            Left err'    -> Left err'
            Right iStmts-> Right (iStmt:iStmts)

checkStmt::M_stmt -> ST -> Either String I_stmt
checkStmt stmt st = case stmt of
    -- M_ass    (String, M_expr)
    -- I_ass    (Int,Int,I_expr)
    (M_ass(str, expr)) ->
        let
            I_VARIABLE(level, offset, strType) = look_up st str
        in
        case (checkExpr expr st) of
            Left err            -> Left err
            Right (eType, iExpr)->
                if (strType == eType)
                then Right (I_ass(level, offset, iExpr))
                else Left ("Illegal assignment. Expected " ++ (typeToString strType) ++ " recieved " ++ (typeToString eType))
    -- M_while   (M_expr, M_stmt)
    -- I_while   (I_expr,I_stmt)
    (M_while(expr, stmt)) -> 
        case (checkExpr expr st) of
            Left err            -> Left err
            Right (eType, iExpr)-> do
                if (isBool eType)
                then 
                    case (checkStmt stmt st) of
                    Left err    -> Left err
                    Right iStmt -> Right (I_while(iExpr, iStmt))
                else 
                    Left ("Illegal Expression. Boolean expected")
    -- M_cond    (M_expr, M_stmt, M_stmt)
    -- I_cond    (I_expr,I_stmt,I_stmt)
    (M_cond(expr, stmt1, stmt2)) -> 
        case (checkExpr expr st) of
                Left err            -> Left err
                Right (eType, iExpr)-> do
                    if (isBool eType)
                    then case (checkStmt stmt1 st) of
                        Left err     -> Left err
                        Right iStmt1 -> case (checkStmt stmt2 st) of
                            Left err    -> Left err
                            Right iStmt2-> Right (I_cond(iExpr, iStmt1, iStmt2))
                    else Left ("Illegal Expression. Boolean expected")
    -- M_read    String
    -- I_read_I  (Int,Int)
    -- I_read_B  (Int,Int)
    (M_read(str)) -> 
        let 
            (I_VARIABLE(level, offset, strType)) = look_up st str
        in
        if (isNum strType) -- only 2 types int and bool
        then Right (I_read_I (level, offset))
        else Right (I_read_B (level, offset))
    -- M_print   M_expr
    -- I_print_I I_expr
    -- I_print_B I_expr
    (M_print(expr)) -> 
        case (checkExpr expr st) of
            Left err             -> Left err
            Right (eType, iExpr) -> 
                if (isNum eType)
                then Right (I_print_I iExpr)
                else Right (I_print_B iExpr)
    -- M_return  M_expr
    -- I_return  I_expr
    (M_return(expr)) -> 
        case (checkExpr expr st) of
            Left err             -> Left err
            Right (eType, iExpr) -> Right (I_return(iExpr))
    -- M_block   ([M_decl], [M_stmt])
    -- I_block   ([I_fbody],Int,[I_stmt])
    (M_block(declList, stmtList)) ->
        let
            varList = filter isVarDec declList
            funList = filter isFunDec declList
        in
        case (insertVars varList (new_scope st)) of 
        Left err -> Left err
        Right st' -> case (insertFuncs funList st') of
            Left err -> Left err
            Right st'' ->  
                case (checkFuncs funList st'') of
                    Left err'    -> Left err'
                    Right iFuncs ->
                        case (checkStmts stmtList st'') of 
                            Left err'   -> Left err'
                            Right stmts -> Right (I_block(iFuncs, length varList, stmts))


            
            
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
-- I_fun (String,[I_fbody],Int,[I_stmt])
checkFuncs::[M_decl] -> ST -> Either String [I_fbody]
checkFuncs [] _ = Right []
checkFuncs (f:fs) st = case (checkFunc f st) of
    Left err -> Left err 
    Right cf  -> 
        case (checkFuncs fs st) of
            Left err' -> Left err'
            Right cfs -> Right (cf:cfs)
    
checkFunc::M_decl -> ST -> Either String I_fbody
checkFunc (M_fun(fName , args, return, M_prog(decls, stmts))) st =
    let
        varList = filter isVarDec decls
        funList = filter isFunDec decls
    in
    case (insertArgs args (new_scope st)) of
        Left err -> Left err
        Right st' ->
            case (insertVars varList st') of 
                Left err -> Left err
                Right st'' -> 
                    case (insertFuncs funList st'') of
                        Left err' -> Left err'
                        Right st''' ->  
                            case (checkFuncs funList st''') of
                                Left err'' -> Left err''
                                Right iFunc ->
                                    case (checkStmts stmts st''') of 
                                        Left err'''    -> Left err'''
                                        Right stmtList -> Right (I_fun("func_" ++ fName, iFunc, length varList, stmtList))
            
            
            
-- M_prog ([M_decl], [M_stmt])
-- I_prog ([I_fbody],Int,[I_stmt])
genIR::M_prog -> Either String I_prog
genIR (M_prog (declList, stmtList)) =
    let
        varList = filter isVarDec declList
        funList = filter isFunDec declList
    in
    case (insertVars varList (new_scope empty)) of 
        Left err -> Left err
        Right st' -> 
            case (insertFuncs funList st') of
                Left err' -> Left err'
                Right st'' ->  
                    case (checkFuncs funList st'') of
                        Left err''   -> Left err''
                        Right iFuncs ->
                            case (checkStmts stmtList st'') of 
                                Left err''' -> Left err'''
                                Right stmts -> Right (I_prog(iFuncs, length varList, stmts))

      
    
    
    
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
    
