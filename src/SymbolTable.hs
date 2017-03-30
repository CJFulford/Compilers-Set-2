module SymbolTable (ST,empty,new_scope,insert,lookup,return)

data SYM_DESC = ARGUMENT (String,M_type,Int)
              | VARIABLE (String,M_type,Int)
              | FUNCTION (String,[(M_type,Int)],M_type)
              | DATATYPE String 
              | CONSTRUCTOR (String, [M_type], String)
				deriving (Eq,Show,Generic,Out)
              
data SYM_I_DESC = I_VARIABLE (Int,Int,M_type,Int)
				| I_FUNCTION (Int,String,[(M_type,Int)],M_type)
				| I_CONSTRUCTOR (Int,[M_type],String)
				| I_TYPE [String]
				deriving (Eq,Show,Generic,Out)

data ScopeType = L_PROG 
				| L_FUN M_Type 
				| L_BLK 
				| L_CASE 
				deriving (Eq,Show,Generic,Out)  
				
-- data and types ====================      
data SYM_VALUE = Var_attr (Int,M_type,Int)
              | Fun_attr (String,[(M_type,Int)],M_type)
              | Con_attr (Int, [M_type], String)
              | Typ_attr [String]       
           deriving (Eq,Show,Generic,Out)   

data SYM_TABLE = Symbol_table (Int,Int,[(String,SYM_VALUE)])
           deriving (Eq,Show,Generic,Out)

type ST = [SYM_TABLE]

-- Basic ====================
empty::ST
empty = []

new_scope:: ST -> ST 
new_scope s = (Symbol_table(0,0,[])):s

return:: ST -> M_type

-- Lookup ====================
{-
The subsiduary function "found" simply converts the data retrieved into the 
form required by the lookup from the internal form.  "find_level" searches 
a level for the symbol while "find" searches the levels in turn until the 
symbol is found raising an exception when it is not found.
-}


look_up:: ST -> String -> SYM_I_DESC
look_up s x = find 0 s where

    found level (Var_attr(offset, type_, dim))      = I_VARIABLE(level, offset, type_, dim)      
    found level (Fun_attr(label, arg_Type, type_))  = I_FUNCTION(level, label, arg_Type, type_)
    found level (Con_attr(offset, args, name))      = I_CONSTRUCTOR(offset, args, name)      
    found level (Typ_attr(lstr))                    = I_TYPE(lstr)
    
    find_level [] = Nothing
    find_level ((str,v):rest)   | x == str = Just v
                                | otherwise =  find_level rest
                           
    find n [] = error ("Could not find " ++ str)
    find n (Symbol_table(_, _, vs)::rest) = 
        (case find_level vs of 
            Just v -> found n v
            Nothing -> find (n+1) rest)





-- Insertion ====================

getLabel:: Int -> String -> String
getLabel n str = "func_" + show n

insert:: Int -> ST -> SYM_DESC -> (Int,ST)
insert n [] d =  error "Symbol table error: insertion before defining scope."

-- ARGUMENT (String,M_type,Int)
insert n ((Symbol_table(nL, nA, sL)):rest) (ARGUMENT(str, T, dim)) 
       {-error-}| (in_index_list str sL) = error( "Symbol table error: " ++ str ++ "is already defined.")
       | otherwise = (n, Symbol_table(nL, nA+1, (str, Var_attr(~(nA+4), T, dim))::sL))

-- VARIABLE (String,M_type,Int)
insert n ((Symbol_table(nL, nA, sL)):rest) (VARIABLE (str, T, dim)) 
       {-error-}| (in_index_list str sL) = error ("Symbol table error: " ++ str ++ "is already defined.")
       | otherwise = (n, Symbol_table(nL+1, nA, (str, Var_attr(nL+1, T, dim))::sL))

-- FUNCTION (String,[(M_type,Int)],M_type)
insert n ((Symbol_table(nL, nA, sL)):rest) FUNCTION (str, Ts, T)
       {-error-}| (in_index_list str sL) = error ("Symbol table error: " ++ str ++ "is already defined.")
       | otherwise = (n+1, (Symbol_table(nL, nA, (str, Fun_attr(getlabel n, Ts, T)):sL)):rest)

-- DATATYPE (String) 
insert n ((Symbol_table(nL, nA, sL)):rest) DATATYPE (str)
       {-error-}| (in_index_list str sL) = error ("Symbol table error: " ++ str ++ "is already defined.")
       | otherwise = (n, (Symbol_table(nL, nA, (str, typ_attr(str)):sL)):rest)

-- CONSTRUCTOR (String, [M_type], String)
insert n ((Symbol_table(nL, nA, sL)):rest) CONSTRUCTOR (str1, Ts, str2)
       {-error-}| (in_index_list str sL) = error ("Symbol table error: " ++ str ++ "is already defined.")
       | otherwise = (n, (Symbol_table(nL, nA, (str, Con_attr(str1, Ts, str2)):sL)):rest)    

where in_index_list str [] = False
          in_index_list str ((x,_):xs)| str==x = True
                                      | otherwise = in_index_list str xs






