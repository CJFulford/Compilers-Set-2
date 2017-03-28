module SymbolTypes

import AST

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
              
insert::Int -> ST -> SYM_DESC -> (Int,ST)    
lookup: ST -> String -> SYM_I_DESC  
empty:: ST
new_scope:: ScopeType -> ST -> ST
return:: ST -> M_type        
