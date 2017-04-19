module SkelM where

-- Haskell module generated by the BNF converter

import AbsM
import ErrM
type Result = Err String

failure :: Show a => a -> Result
failure x = Bad $ "Undefined case: " ++ show x

transID :: ID -> Result
transID x = case x of
  ID string -> failure x
transIVAL :: IVAL -> Result
transIVAL x = case x of
  IVAL string -> failure x
transBVAL :: BVAL -> Result
transBVAL x = case x of
  BVAL string -> failure x
transProg :: Prog -> Result
transProg x = case x of
  ProgBlock block -> failure x
transBlock :: Block -> Result
transBlock x = case x of
  Block1 declarations programbody -> failure x
transDeclarations :: Declarations -> Result
transDeclarations x = case x of
  Declarations1 declaration declarations -> failure x
  Declarations2 -> failure x
transDeclaration :: Declaration -> Result
transDeclaration x = case x of
  DeclarationVar_declaration vardeclaration -> failure x
  DeclarationFun_declaration fundeclaration -> failure x
transVar_declaration :: Var_declaration -> Result
transVar_declaration x = case x of
  Var_declaration1 basicvardeclaration -> failure x
transBasic_var_declaration :: Basic_var_declaration -> Result
transBasic_var_declaration x = case x of
  Basic_var_declaration1 identifier type_ -> failure x
transFun_declaration :: Fun_declaration -> Result
transFun_declaration x = case x of
  Fun_declaration1 identifier paramlist type_ funblock -> failure x
transFun_block :: Fun_block -> Result
transFun_block x = case x of
  Fun_block1 declarations funbody -> failure x
transParam_list :: Param_list -> Result
transParam_list x = case x of
  Param_list1 parameters -> failure x
transParameters :: Parameters -> Result
transParameters x = case x of
  ParametersParameters1 parameters -> failure x
  Parameters1 -> failure x
  Parameters11 parameters basicvardeclaration -> failure x
  Parameters1Basic_var_declaration basicvardeclaration -> failure x
transIdentifier :: Identifier -> Result
transIdentifier x = case x of
  IdentifierID id -> failure x
transType :: Type -> Result
transType x = case x of
  Type_int -> failure x
  Type_bool -> failure x
transProgram_body :: Program_body -> Result
transProgram_body x = case x of
  Program_body1 progstmts -> failure x
transFun_body :: Fun_body -> Result
transFun_body x = case x of
  Fun_body1 progstmts expr -> failure x
transProg_stmts :: Prog_stmts -> Result
transProg_stmts x = case x of
  Prog_stmts1 progstmt progstmts -> failure x
  Prog_stmts2 -> failure x
transProg_stmt :: Prog_stmt -> Result
transProg_stmt x = case x of
  Prog_stmt1 expr progstmt1 progstmt2 -> failure x
  Prog_stmt2 expr progstmt -> failure x
  Prog_stmt3 id -> failure x
  Prog_stmt4 id expr -> failure x
  Prog_stmt5 expr -> failure x
  Prog_stmt6 block -> failure x
transExpr :: Expr -> Result
transExpr x = case x of
  Expr1 expr bintterm -> failure x
  ExprBint_term bintterm -> failure x
transBint_term :: Bint_term -> Result
transBint_term x = case x of
  Bint_term1 bintterm bintfactor -> failure x
  Bint_termBint_factor bintfactor -> failure x
transBint_factor :: Bint_factor -> Result
transBint_factor x = case x of
  Bint_factor1 bintfactor -> failure x
  Bint_factor2 intexpr1 compareop intexpr2 -> failure x
  Bint_factorInt_expr intexpr -> failure x
transCompare_op :: Compare_op -> Result
transCompare_op x = case x of
  Compare_op1 -> failure x
  Compare_op2 -> failure x
  Compare_op3 -> failure x
  Compare_op4 -> failure x
  Compare_op5 -> failure x
transInt_expr :: Int_expr -> Result
transInt_expr x = case x of
  Int_expr1 intexpr addop intterm -> failure x
  Int_exprInt_term intterm -> failure x
transAddop :: Addop -> Result
transAddop x = case x of
  Addop1 -> failure x
  Addop2 -> failure x
transInt_term :: Int_term -> Result
transInt_term x = case x of
  Int_term1 intterm mulop intfactor -> failure x
  Int_termInt_factor intfactor -> failure x
transMulop :: Mulop -> Result
transMulop x = case x of
  Mulop1 -> failure x
  Mulop2 -> failure x
transInt_factor :: Int_factor -> Result
transInt_factor x = case x of
  Int_factor1 expr -> failure x
  Int_factor2 id argumentlist -> failure x
  Int_factorIVAL ival -> failure x
  Int_factorBVAL bval -> failure x
  Int_factor3 intfactor -> failure x
transArgument_list :: Argument_list -> Result
transArgument_list x = case x of
  Argument_list1 arguments -> failure x
  Argument_list2 -> failure x
transArguments :: Arguments -> Result
transArguments x = case x of
  ArgumentsArguments1 arguments -> failure x
  Arguments1 -> failure x
  Arguments11 arguments expr -> failure x
  Arguments1Expr expr -> failure x
