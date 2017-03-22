module SkelM where

-- Haskell module generated by the BNF converter

import AbsM
import ErrM
import qualified AST as A
type Result = Err String

failure :: Show a => a -> Result
failure x = Bad $ "Undefined case: " ++ show x


-- all tokens
transCID :: CID -> String 
transCID x = case x of
  CID string -> string

transID :: ID -> String
transID x = case x of
  ID string -> string
  
transRVAL :: RVAL -> String
transRVAL x = case x of
  RVAL string -> string

transIVAL :: IVAL -> String
transIVAL x = case x of
  IVAL string -> string

transBVAL :: BVAL -> String
transBVAL x = case x of
  BVAL string -> string

transCVAL :: CVAL ->String
transCVAL x = case x of
  CVAL string -> string
  
  
  
-- beginnning of program
transProg :: Prog -> A.M_prog
transProg x = case x of
  ProgBlock block -> transBlock block

transBlock :: Block -> ([A.M_decl],[A.M_stmt])
transBlock x = case x of
  Block1 declarations programbody -> (transDeclarations declarations, transProgram_body programbody)

transDeclarations :: Declarations -> [A.M_decl]
transDeclarations x = case x of
  Declarations1 declaration declarations -> (transDeclaration declaration):(transDeclarations declarations)
  Declarations2 -> []

transDeclaration :: Declaration -> A.M_decl
transDeclaration x = case x of
  DeclarationVar_declaration vardeclaration -> transVar_declaration vardeclaration
  DeclarationFun_declaration fundeclaration -> transFun_declaration funDeclaration
  DeclarationData_declaration datadeclaration -> transData_declaration datadeclaration

transVar_declaration :: Var_declaration -> A.M_var
transVar_declaration x = case x of
  Var_declaration1 varspecs type_ -> A.M_var (transVar_specs varspecs) (transType type_)

transVar_specs :: Var_specs -> (String,[A.M_expr])
transVar_specs x = case x of
  Var_specs1 varspec morevarspecs -> (transVar_spec varspec):(transMore_var_specs morevarspecs)

transMore_var_specs :: More_var_specs -> [A.M_expr]
transMore_var_specs x = case x of
  More_var_specs1 varspec morevarspecs -> (transVar_spec varspec):(transMore_var_specs morevarspecs)
  More_var_specs2 -> []

transVar_spec :: Var_spec -> A.M_expr
transVar_spec x = case x of
  Var_spec1 id arraydimensions -> A.M_id (transID id, transArray_dimensions arraydimensions)

transArray_dimensions :: Array_dimensions -> [A.M_expr]
transArray_dimensions x = case x of
  Array_dimensions1 expr arraydimensions -> (transExpr expr):(transArray_dimensions arraydimensions)
  Array_dimensions2 -> []

transType :: Type -> A.M_type
transType x = case x of
  Type_int -> A.M_int
  Type_real -> A.M_real
  Type_bool -> A.M_bool
  Type_char -> A.M_char
  TypeID id -> transID id

transFun_declaration :: Fun_declaration -> A.M_fun
transFun_declaration x = case x of
  Fun_declaration1 id paramlist type_ funblock -> (transID id, transParam_list paramlist, transType type_, transFun_block block)

transFun_block :: Fun_block -> ([M_decl],[M_stmt])
transFun_block x = case x of
  Fun_block1 declarations funbody -> (transDeclarations declarations, transFun_body funbody)

transParam_list :: Param_list -> [(String,Int,A.M_type)]
transParam_list x = case x of
  Param_list1 parameters -> transParameters parameters

transParameters :: Parameters -> [(String,Int,A.M_type)]
transParameters x = case x of
  Parameters1 basicdeclaration moreparameters -> (transBasic_declaration basicdecaration):(transMore_parameters moreparameters)
  Parameters2 -> []

transMore_parameters :: More_parameters -> [(String,Int,A.M_type)]
transMore_parameters x = case x of
  More_parameters1 basicdeclaration moreparameters -> (transBasic_declaration basicdeclaration):(transMore_parameters moreparameters)
  More_parameters2 -> []

transBasic_declaration :: Basic_declaration -> (String,Int,A.M_type)
transBasic_declaration x = case x of
  Basic_declaration1 id basicarraydimensions type_ -> (transID id, transBasic_array_dimensions basicarraydimensions, transType type_)

transBasic_array_dimensions :: Basic_array_dimensions -> Int
transBasic_array_dimensions x = case x of
  Basic_array_dimensions1 basicarraydimensions -> 1 + (transBasic_array_dimensions basicarraydimensions)
  Basic_array_dimensions2 -> 0

transData_declaration :: Data_declaration -> A.M_data
transData_declaration x = case x of
  Data_declaration1 id consdeclarations -> (transID id, transCons_declarations consdelarations)

transCons_declarations :: Cons_declarations -> [(String,[A.M_type])]
transCons_declarations x = case x of
  Cons_declarations1 consdecl moreconsdecl -> (transCons_decl consdecl):(transMore_cons_decl moreconsdecl)

transMore_cons_decl :: More_cons_decl -> [(String,[A.M_type])]
transMore_cons_decl x = case x of
  More_cons_decl1 consdecl moreconsdecl -> (transCons_decl consdecl):(transMore_cons_decl moreconsdecl)
  More_cons_decl2 -> []

transCons_decl :: Cons_decl -> (String,[A.M_type])
transCons_decl x = case x of
  Cons_decl1 cid typelist -> (transCID cid, transType_list type_)
  Cons_declCID cid -> (transCID cid, [])

transType_list :: Type_list -> [A.M_type]
transType_list x = case x of
  Type_list1 type_ moretype -> (transType type_):(transMore_type moretype)

transMore_type :: More_type -> [A.M_type]
transMore_type x = case x of
  More_type1 type_ moretype -> (transType type_):(transMore_type moretype)
  More_type2 -> []

transProgram_body :: Program_body -> [A.M_stmt]
transProgram_body x = case x of
  Program_body1 progstmts -> transProg_stmts progstmts
  Program_bodyProg_stmts progstmts -> transProg_stmts progstmts

transFun_body :: Fun_body -> [A.M_stmt]
transFun_body x = case x of
  Fun_body1 progstmts expr -> (transProg_stmts progstmts):(transExpr expr)
  Fun_body2 progstmts expr -> (transProg_stmts progstmts):(transExpr expr)

transProg_stmts :: Prog_stmts -> [A.M_stmt]
transProg_stmts x = case x of
  Prog_stmts1 progstmt progstmts -> (transProg_stmt progstmt):(transProg_stmts progstmts)
  Prog_stmts2 -> []

transProg_stmt :: Prog_stmt -> A.M_stmt
transProg_stmt x = case x of
  Prog_stmt1 expr progstmt1 progstmt2 -> A.M_cond (transExpr expr) (transProg_stmt progstmt1) (transProg_stmt progstmt2)
  Prog_stmt2 expr progstmt -> A.M_while (transExpr expr) (transProg_stmt progstmt)
  Prog_stmt3 location -> A.M_print (transLocation location)
  Prog_stmt4 location expr -> A.M_read (transLocation location) (transExpr expr)
  Prog_stmt5 expr -> A.M_return (transExpr expr)
  Prog_stmt6 block -> A.M_block (transBlock block)
  Prog_stmt7 expr caselist -> A.M_case (transExpr expr) (transCase_list caselist)

transLocation :: Location -> String
transLocation x = case x of
  Location1 id arraydimensions -> (transID id) (transArray_dimensions arraydimensions)

transCase_list :: Case_list -> [(String,[String],A.M_stmt)]
transCase_list x = case x of
  Case_list1 case_ morecase -> (transCase case_):(transMore_case morecase)

transMore_case :: More_case -> [(String,[String],A.M_stmt)]
transMore_case x = case x of
  More_case1 case_ morecase -> (transCase case_):(transMore_case morecase)
  More_case2 -> []

transCase :: Case -> (String,[String],A.M_stmt)
transCase x = case x of
  Case1 cid varlist progstmt -> (transCID cid, transVar_list varlist, transProg_stmt progstmt)

transVar_list :: Var_list -> [String]
transVar_list x = case x of
  Var_list1 varlist -> transVar_list varlist
  Var_list2 -> []
  Var_list11 id morevarlist -> (transID id):(transMore_var_list morevarlist)

transMore_var_list :: More_var_list -> [String]
transMore_var_list x = case x of
  More_var_list1 id morevarlist -> (transID id):(transMore_var_list morevarlist)
  More_var_list2 -> []

transExpr :: Expr -> A.M_expr
transExpr x = case x of
  Expr1 expr bintterm -> (transExpr expr) (transBint_term bintterm)
  ExprBint_term bintterm -> transBint_term bintterm

transBint_term :: Bint_term -> A.M_Expr
transBint_term x = case x of
  Bint_term1 bintterm bintfactor -> (transBint_term bintterm)
  Bint_termBint_factor bintfactor -> transBint_factor bintfactor

transBint_factor :: Bint_factor -> A.M_expr
transBint_factor x = case x of
  Bint_factor1 bintfactor -> transBint_factor bintfactor
  Bint_factor2 intexpr1 compareop intexpr2 -> (transInt_expr intexpr1) (transCompare_op compareop) (transInt_expr intexpr2)
  Bint_factorInt_expr intexpr -> transInt_expr intxpr

transCompare_op :: Compare_op -> A.M_operation
transCompare_op x = case x of
  Compare_op1 -> A.M_eq
  Compare_op2 -> A.M_lt
  Compare_op3 -> A.M_gt
  Compare_op4 -> A.M_le
  Compare_op5 -> A.M_ge

transInt_expr :: Int_expr -> A.M_expr
transInt_expr x = case x of
  Int_expr1 intexpr addop intterm -> (transInt_expr intexpr) (transAddop addop) (transInt_term intterm)
  Int_exprInt_term intterm -> transInt_term intterm

transAddop :: Addop -> A.M_operation
transAddop x = case x of
  Addop1 -> A.M_add
  Addop2 -> A.M_sub

transInt_term :: Int_term -> A.M_expr
transInt_term x = case x of
  Int_term1 intterm mulop intfactor -> (transInt_term intterm) (transMulop mulop) (transInt_factor intfactor)
  Int_termInt_factor intfactor -> transInt_factor intfactor

transMulop :: Mulop -> A.M_operation
transMulop x = case x of
  Mulop1 -> A.M_mul
  Mulop2 -> A.M_div

transInt_factor :: Int_factor -> A.M_expr
transInt_factor x = case x of
  Int_factor1 expr -> transExpr expr
  Int_factor2 id basicarraydimensions -> A.M_size (transID id) (transBasic_array_dimensions basicarrayDimensions)
  Int_factor3 expr -> transExpr expr
  Int_factor4 expr -> transExpr expr
  Int_factor5 expr -> transExpr expr
  Int_factor6 id modifierlist -> A.M_id (transID id) (transModifier_list modifierlist)
  Int_factor7 cid consargumentlist -> A.M_id (transCID cid) (transCons_argument_list consargumentlist)
  Int_factorIVAL ival -> A.M_ival ival
  Int_factorRVAL rval -> A.M_rval rval
  Int_factorBVAL bval -> A.M_bval bval
  Int_factorCVAL cval -> A.M_cval cval
  Int_factor8 intfactor -> transInt_factor intfactor

transModifier_list :: Modifier_list -> [A.M_expr]
transModifier_list x = case x of
  Modifier_listFun_argument_list funargumentlist -> transFun_argument_list funargumentlist
  Modifier_listArray_dimensions arraydimensions -> transArray_dimensions arrayDimensions

transFun_argument_list :: Fun_argument_list -> [A.M_expr]
transFun_argument_list x = case x of
  Fun_argument_list1 arguments -> transArguments arguments

transCons_argument_list :: Cons_argument_list -> [A.M_expr]
transCons_argument_list x = case x of
  Cons_argument_listFun_argument_list funargumentlist -> transFun_argument_list funargumentlist
  Cons_argument_list1 -> []

transArguments :: Arguments -> [A.M_expr]
transArguments x = case x of
  Arguments1 expr morearguments -> (transExpr expr):(transMore_arguments morearguments)
  Arguments2 -> []

transMore_arguments :: More_arguments -> [A.M_expr]
transMore_arguments x = case x of
  More_arguments1 expr morearguments -> (transExpr expr):(transMore_arguments morearguments)
  More_arguments2 -> []

