{-# LANGUAGE DeriveGeneric #-}

module AST where

import Text.PrettyPrint.GenericPretty

data M_prog = M_prog ([M_decl], [M_stmt])
            deriving (Generic, Out)
            
data M_decl = M_var (String, M_type)
            | M_fun (String ,[(String, M_type)], M_type, M_prog)
           deriving (Eq, Show, Generic, Out)
           
data M_stmt = M_ass (String, M_expr)
            | M_while (M_expr, M_stmt)
            | M_cond (M_expr, M_stmt, M_stmt) 
            | M_read String
            | M_print M_expr
            | M_return M_expr
            | M_block ([M_decl], [M_stmt])
           deriving (Eq, Show, Generic, Out)
           
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









