-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParM where
import AbsM
import LexM
import ErrM

}

%name pProg Prog
%name pBlock Block
%name pDeclarations Declarations
%name pDeclaration Declaration
%name pVar_declaration Var_declaration
%name pBasic_var_declaration Basic_var_declaration
%name pFun_declaration Fun_declaration
%name pFun_block Fun_block
%name pParam_list Param_list
%name pParameters Parameters
%name pParameters1 Parameters1
%name pIdentifier Identifier
%name pType Type
%name pProgram_body Program_body
%name pFun_body Fun_body
%name pProg_stmts Prog_stmts
%name pProg_stmt Prog_stmt
%name pExpr Expr
%name pBint_term Bint_term
%name pBint_factor Bint_factor
%name pCompare_op Compare_op
%name pInt_expr Int_expr
%name pAddop Addop
%name pInt_term Int_term
%name pMulop Mulop
%name pInt_factor Int_factor
%name pArgument_list Argument_list
%name pArguments Arguments
%name pArguments1 Arguments1
-- no lexer declaration
%monad { Err } { thenM } { returnM }
%tokentype {Token}
%token
  '&&' { PT _ (TS _ 1) }
  '(' { PT _ (TS _ 2) }
  ')' { PT _ (TS _ 3) }
  '*' { PT _ (TS _ 4) }
  '+' { PT _ (TS _ 5) }
  ',' { PT _ (TS _ 6) }
  '-' { PT _ (TS _ 7) }
  '/' { PT _ (TS _ 8) }
  ':' { PT _ (TS _ 9) }
  ':=' { PT _ (TS _ 10) }
  ';' { PT _ (TS _ 11) }
  '<' { PT _ (TS _ 12) }
  '=' { PT _ (TS _ 13) }
  '=<' { PT _ (TS _ 14) }
  '>' { PT _ (TS _ 15) }
  '>=' { PT _ (TS _ 16) }
  'begin' { PT _ (TS _ 17) }
  'bool' { PT _ (TS _ 18) }
  'do' { PT _ (TS _ 19) }
  'else' { PT _ (TS _ 20) }
  'end' { PT _ (TS _ 21) }
  'fun' { PT _ (TS _ 22) }
  'if' { PT _ (TS _ 23) }
  'int' { PT _ (TS _ 24) }
  'not' { PT _ (TS _ 25) }
  'print' { PT _ (TS _ 26) }
  'read' { PT _ (TS _ 27) }
  'return' { PT _ (TS _ 28) }
  'then' { PT _ (TS _ 29) }
  'var' { PT _ (TS _ 30) }
  'while' { PT _ (TS _ 31) }
  '{' { PT _ (TS _ 32) }
  '||' { PT _ (TS _ 33) }
  '}' { PT _ (TS _ 34) }

L_ID { PT _ (T_ID $$) }
L_IVAL { PT _ (T_IVAL $$) }
L_BVAL { PT _ (T_BVAL $$) }


%%

ID    :: { ID} : L_ID { ID ($1)}
IVAL    :: { IVAL} : L_IVAL { IVAL ($1)}
BVAL    :: { BVAL} : L_BVAL { BVAL ($1)}

Prog :: { Prog }
Prog : Block { AbsM.ProgBlock $1 }
Block :: { Block }
Block : Declarations Program_body { AbsM.Block1 $1 $2 }
Declarations :: { Declarations }
Declarations : Declaration ';' Declarations { AbsM.Declarations1 $1 $3 }
             | {- empty -} { AbsM.Declarations2 }
Declaration :: { Declaration }
Declaration : Var_declaration { AbsM.DeclarationVar_declaration $1 }
            | Fun_declaration { AbsM.DeclarationFun_declaration $1 }
Var_declaration :: { Var_declaration }
Var_declaration : 'var' Basic_var_declaration { AbsM.Var_declaration1 $2 }
Basic_var_declaration :: { Basic_var_declaration }
Basic_var_declaration : Identifier ':' Type { AbsM.Basic_var_declaration1 $1 $3 }
Fun_declaration :: { Fun_declaration }
Fun_declaration : 'fun' Identifier Param_list ':' Type '{' Fun_block '}' { AbsM.Fun_declaration1 $2 $3 $5 $7 }
Fun_block :: { Fun_block }
Fun_block : Declarations Fun_body { AbsM.Fun_block1 $1 $2 }
Param_list :: { Param_list }
Param_list : '(' Parameters ')' { AbsM.Param_list1 $2 }
Parameters :: { Parameters }
Parameters : Parameters1 { AbsM.ParametersParameters1 $1 }
           | {- empty -} { AbsM.Parameters1 }
Parameters1 :: { Parameters }
Parameters1 : Parameters1 ',' Basic_var_declaration { AbsM.Parameters11 $1 $3 }
            | Basic_var_declaration { AbsM.Parameters1Basic_var_declaration $1 }
Identifier :: { Identifier }
Identifier : ID { AbsM.IdentifierID $1 }
Type :: { Type }
Type : 'int' { AbsM.Type_int } | 'bool' { AbsM.Type_bool }
Program_body :: { Program_body }
Program_body : 'begin' Prog_stmts 'end' { AbsM.Program_body1 $2 }
Fun_body :: { Fun_body }
Fun_body : 'begin' Prog_stmts 'return' Expr ';' 'end' { AbsM.Fun_body1 $2 $4 }
Prog_stmts :: { Prog_stmts }
Prog_stmts : Prog_stmt ';' Prog_stmts { AbsM.Prog_stmts1 $1 $3 }
           | {- empty -} { AbsM.Prog_stmts2 }
Prog_stmt :: { Prog_stmt }
Prog_stmt : 'if' Expr 'then' Prog_stmt 'else' Prog_stmt { AbsM.Prog_stmt1 $2 $4 $6 }
          | 'while' Expr 'do' Prog_stmt { AbsM.Prog_stmt2 $2 $4 }
          | 'read' ID { AbsM.Prog_stmt3 $2 }
          | ID ':=' Expr { AbsM.Prog_stmt4 $1 $3 }
          | 'print' Expr { AbsM.Prog_stmt5 $2 }
          | '{' Block '}' { AbsM.Prog_stmt6 $2 }
Expr :: { Expr }
Expr : Expr '||' Bint_term { AbsM.Expr1 $1 $3 }
     | Bint_term { AbsM.ExprBint_term $1 }
Bint_term :: { Bint_term }
Bint_term : Bint_term '&&' Bint_factor { AbsM.Bint_term1 $1 $3 }
          | Bint_factor { AbsM.Bint_termBint_factor $1 }
Bint_factor :: { Bint_factor }
Bint_factor : 'not' Bint_factor { AbsM.Bint_factor1 $2 }
            | Int_expr Compare_op Int_expr { AbsM.Bint_factor2 $1 $2 $3 }
            | Int_expr { AbsM.Bint_factorInt_expr $1 }
Compare_op :: { Compare_op }
Compare_op : '=' { AbsM.Compare_op1 }
           | '<' { AbsM.Compare_op2 }
           | '>' { AbsM.Compare_op3 }
           | '=<' { AbsM.Compare_op4 }
           | '>=' { AbsM.Compare_op5 }
Int_expr :: { Int_expr }
Int_expr : Int_expr Addop Int_term { AbsM.Int_expr1 $1 $2 $3 }
         | Int_term { AbsM.Int_exprInt_term $1 }
Addop :: { Addop }
Addop : '+' { AbsM.Addop1 } | '-' { AbsM.Addop2 }
Int_term :: { Int_term }
Int_term : Int_term Mulop Int_factor { AbsM.Int_term1 $1 $2 $3 }
         | Int_factor { AbsM.Int_termInt_factor $1 }
Mulop :: { Mulop }
Mulop : '*' { AbsM.Mulop1 } | '/' { AbsM.Mulop2 }
Int_factor :: { Int_factor }
Int_factor : '(' Expr ')' { AbsM.Int_factor1 $2 }
           | ID Argument_list { AbsM.Int_factor2 $1 $2 }
           | IVAL { AbsM.Int_factorIVAL $1 }
           | BVAL { AbsM.Int_factorBVAL $1 }
           | '-' Int_factor { AbsM.Int_factor3 $2 }
Argument_list :: { Argument_list }
Argument_list : '(' Arguments ')' { AbsM.Argument_list1 $2 }
              | {- empty -} { AbsM.Argument_list2 }
Arguments :: { Arguments }
Arguments : Arguments1 { AbsM.ArgumentsArguments1 $1 }
          | {- empty -} { AbsM.Arguments1 }
Arguments1 :: { Arguments }
Arguments1 : Arguments1 ',' Expr { AbsM.Arguments11 $1 $3 }
           | Expr { AbsM.Arguments1Expr $1 }
{

returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++ 
  case ts of
    [] -> []
    [Err _] -> " due to lexer error"
    _ -> " before " ++ unwords (map (id . prToken) (take 4 ts))

myLexer = tokens
}

