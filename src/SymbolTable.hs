module SymbolTable where

import AST
import Text.PrettyPrint.GenericPretty

data SYM_DESC = ARGUMENT (String,M_type)
              | VARIABLE (String,M_type)
              | FUNCTION (String,[M_type],M_type)
                deriving (Eq,Show,Generic,Out)
              
data SYM_I_DESC = I_VARIABLE (Int,Int,M_type)
                | I_FUNCTION (Int,String,[M_type],M_type)
                deriving (Eq,Show,Generic,Out)
                
-- data and types ====================      
data SYM_VALUE = Var_attr (Int,M_type)
               | Fun_attr (String,[M_type],M_type)
                deriving (Eq,Show,Generic,Out)   

data SYM_TABLE = Symbol_table (Int,Int,[(String,SYM_VALUE)])
                deriving (Eq,Show,Generic,Out)

type ST = [SYM_TABLE]

-- Basic ====================
empty::ST
empty = []

new_scope:: ST -> ST 
new_scope s = (Symbol_table(0,0,[])):s



-- Look Up ====================
look_up:: ST -> String -> SYM_I_DESC
look_up s x = find 0 s where

    found   level (Var_attr(offset, type_))           = I_VARIABLE(level, offset, type_)      
    found   level (Fun_attr(label, arg_Type, type_))  = I_FUNCTION(level, label, arg_Type, type_)    
    
    
    find_level [] = Nothing
    find_level ((str,v):rest)   
        | x == str = Just v
        | otherwise =  find_level rest
                           
    find n [] = error ("Could not find " ++ x)
    find n (Symbol_table(_, _, vs):rest) = 
        (case find_level vs of 
            Just v -> found n v
            Nothing -> find (n+1) rest)




insert:: ST -> SYM_DESC -> Either String ST
insert [] d =  error "Symbol table error: insertion before defining scope."

-- ARGUMENT (String,M_type,Int)
insert ((Symbol_table(nL, nA, sL)):rest) (ARGUMENT(str, t)) 
       | (in_index_list str sL) = Left ("Symbol table error: " ++ str ++ "is already defined.")
       | otherwise = Right (Symbol_table(nL, nA+1, (str, Var_attr(-(nA+4), t)):sL):rest)

-- VARIABLE (String,M_type,Int)
insert ((Symbol_table(nL, nA, sL)):rest) (VARIABLE (str, t)) 
       | (in_index_list str sL) = Left ("Symbol table error: " ++ str ++ "is already defined.")
       | otherwise = Right (Symbol_table(nL+1, nA, (str, Var_attr(nL+1, t)):sL):rest)

-- FUNCTION (String,[(M_type,Int)],M_type)
insert ((Symbol_table(nL, nA, sL)):rest) (FUNCTION (str, ts, t))
       | (in_index_list str sL) = Left ("Symbol table error: " ++ str ++ "is already defined.")
       | otherwise = Right (Symbol_table(nL, nA, (str, Fun_attr(getLabel str, ts, t)):sL):rest)
  
in_index_list::String -> [(String,SYM_VALUE)] -> Bool
in_index_list str [] = False
in_index_list str ((x,_):xs)| str==x = True
                            | otherwise = in_index_list str xs

getLabel:: String -> String
getLabel str = "func_" ++ str





