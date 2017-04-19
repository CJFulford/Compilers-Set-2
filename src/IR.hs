module IR where

import Text.PrettyPrint.GenericPretty

data I_prog  = I_prog ([I_fbody],Int,[I_stmt])
            deriving (Eq, Show, Generic, Out)

data I_fbody = I_fun (String,[I_fbody],Int,[I_stmt])
            deriving (Eq, Show, Generic, Out)

data I_stmt = I_ass      (Int,Int,I_expr)
            | I_while    (I_expr,I_stmt)
            | I_cond     (I_expr,I_stmt,I_stmt)
            | I_read_I   (Int,Int)
            | I_print_I  I_expr
            | I_read_B   (Int,Int)
            | I_print_B  I_expr
            | I_return   I_expr
            | I_block    ([I_fbody],Int,[I_stmt])
            deriving (Eq, Show, Generic, Out)
            
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
