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
data SYM_DESC = ARGUMENT (String,M_type)
              | VARIABLE (String,M_type)
              | FUNCTION (String,[M_type],M_type)
-}

-- M_var (String, M_type)
-- helper funtion for properly formating a list of vars declarations for insertion into the ST as arguments
insertArgs::[[(String, M_type)]] -> ST -> Either String ST
insertArgs [] st = st
insertArgs ((str, type_):vars) st = case (insert st (ARGUMENT(str, type_))) of
    Left err  -> Left err
    Right st' -> insertDecs vars st'

-- M_var (String, M_type)
-- helper funtion for properly formating a list of var declarations for insertion into the ST as variables
insertVars::[M_decl] -> ST -> Either String ST
insertVars [] st = st
insertVars ((M_var(str, type_)):vars) st = case (insert st (VARIABLE(str, type_))) of
    Left err  -> Left err
    Right st' -> insertDecs vars st'

--M_fun (String ,[(String, M_type)], M_type, M_prog)
-- helper funtion for properly formating a list of Fun declarations for insertion into the ST as functions
insertFuncs::[M_decl] -> ST -> Either String ST
insertFuncs [] st = st
insertFuncs ((M_fun(str, args, retType, prog)):funcs) st = case (insert st (FUNCTION(str, map snd args, retType)) of
    Left str -> Left str
    Right st' -> insertFunc funcs st'
    

{-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data M_type = M_int | M_bool    
           deriving (Eq, Show, Generic, Out)
           
data M_expr = M_num Int
            | M_bl Bool
            | M_id String
            | M_app (M_operation, [M_expr])
           deriving (Eq, Show, Generic, Out)
           
data M_operation =  M_fn String 
            | M_add | M_mul | M_sub | M_div | M_neg
            | M_lt | M_le | M_gt | M_ge | M_eq 
            | M_not | M_and | M_or
           deriving (Eq, Show, Generic, Out)       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data I_expr = I_num      Int
            | I_bool     Bool
            | I_id       (Int,Int)
            | I_app      (I_opn,[I_expr])
            deriving (Eq, Show, Generic, Out)
            
data I_opn = I_call (String,Int)    
           | I_add | I_mul | I_sub | I_div | I_neg
           | I_lt  | I_le  | I_gt  | I_ge  | I_eq 
           | I_not | I_and | I_or
            deriving (Eq, Show, Generic, Out)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-}   
    
    
    
checkExprs::[M_expr] -> ST -> Either String [(M_type, I_expr)]
checkExprs (e:es) st = case (checkExpr e st) of
    Left err ->  Left err 
    Right e' -> case (checkExprs es st) of
        Left err' -> Left err'
        Right es' -> Right (e':es')



checkExpr::M_expr -> ST -> Either String (M_type, I_expr)
checkExpr expr st = case expr of
    M_num int -> Right (M_int, I_num int)
    M_bl bool -> Right (M_bool, I_bool bool)
    M_id str  -> Right (eType, (level, offset)) where I_VARIABLE(level, offset, eType)
    M_app (op, exprList) -> case op of
        M_fn str->
            let
                I_FUNCTION(level, label , args, retType) = lookup str st
            in
            case (checkExprs exprList st) of 
                Left err -> Left error
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
                Left err -> Left error
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (foldr (&&) (map (isNum) types))
                    then Right (M_int, I_app(I_add, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_sub -> 
            case (checkExprs exprList st) of 
                Left err -> Left error
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (foldr (&&) (map (isNum) types))
                    then Right (M_int, I_app(I_sub, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_mul -> 
            case (checkExprs exprList st) of 
                Left err -> Left error
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (foldr (&&) (map (isNum) types))
                    then Right (M_int, I_app(I_mul, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_div -> 
            case (checkExprs exprList st) of 
                Left err -> Left error
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (foldr (&&) (map (isNum) types))
                    then Right (M_int, I_app(I_div, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_neg -> 
            case (checkExprs exprList st) of 
                Left err -> Left error
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (foldr (&&) (map (isNum) types))
                    then Right (M_int, I_app(I_neg, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_lt -> 
            case (checkExprs exprList st) of 
                Left err -> Left error
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (foldr (&&) (map (isNum) types))
                    then Right (M_bool, I_app(I_lt, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_le -> 
            case (checkExprs exprList st) of 
                Left err -> Left error
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (foldr (&&) (map (isNum) types))
                    then Right (M_bool, I_app(I_le, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_gt -> 
            case (checkExprs exprList st) of 
                Left err -> Left error
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (foldr (&&) (map (isNum) types))
                    then Right (M_bool, I_app(I_gt, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_ge -> 
            case (checkExprs exprList st) of 
                Left err -> Left error
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (foldr (&&) (map (isNum) types))
                    then Right (M_bool, I_app(I_ge, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_eq -> 
            case (checkExprs exprList st) of 
                Left err -> Left error
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (foldr (&&) (map (isNum) types))
                    then Right (M_bool, I_app(I_eq, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_not -> 
            case (checkExprs exprList st) of 
                Left err -> Left error
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (foldr (&&) (map (isBool) types))
                    then Right (M_bool, I_app(I_not, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_and -> 
            case (checkExprs exprList st) of 
                Left err -> Left error
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (foldr (&&) (map (isBool) types))
                    then Right (M_bool, I_app(I_and, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
        M_or -> 
            case (checkExprs exprList st) of 
                Left err -> Left error
                Right ei ->
                    let
                        types = map fst ei
                        exprs = map snd ei
                    in
                    if (foldr (&&) (map (isBool) types))
                    then Right (M_bool, I_app(I_or, exprs))
                    else Left ("Invalid Expression. Only Integers are valid")
                










checkStmts::[M_stmt] -> ST -> Either String [I_stmt]
checkStmts [] st = Right []
checkStmts (stmt:stmts) st = case (checkStmt stmt st) of
    Left err    -> Left err
    Right iStmt -> case (checkStmts stmts) of
        Left err'    -> Left err'
        Right iStmts-> Right iStmt:iStmts

checkStmt::M_stmt -> ST -> Either String I_stmt
checkStmt stmt st = case stmt of
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


            
            
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
-- I_fun (String,[I_fbody],Int,[I_stmt])         
checkFuncs::[M_decl] -> ST -> [I_fbody]
checkFuncs [] _ -> []
checkFuncs (M_fun (fName , args, return, M_prog(decls, stmts)):fs) st =
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
                        Left err -> Left err
                        Right st''' ->  Right I_fbody(fName, checkFuncs funList st''', length varList, checkStmts stmtList st''')      
            
            
            
-- M_prog ([M_decl], [M_stmt])
-- I_prog ([I_fbody],Int,[I_stmt])
genIR::M_prog -> ST -> Either String I_prog
genIR (M_prog (declList, stmtList)) st =
    let
        varList = filter isVarDec decList
        funList = filter isFunDec decList
    in
    case (insertVars varList st) of 
        Left err -> Left err
        Right st' -> 
            case (insertFuncs funList st') of
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
    
