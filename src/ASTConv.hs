module ASTConv where

import AbsM
import qualified AST as A



-- tokens
transID :: ID -> String
transID x = case x of
    ID string -> string

transIVAL :: IVAL -> Int
transIVAL x = case x of
    IVAL string -> (read string :: Int)

transBVAL :: BVAL -> Bool
transBVAL x = case x of
    BVAL "true" -> True
    BVAL "false" -> False



-- Program
transProg :: Prog -> A.M_prog
transProg x = case x of
    ProgBlock block -> A.M_prog (transBlock block)

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
    DeclarationFun_declaration fundeclaration -> transFun_declaration fundeclaration

transVar_declaration :: Var_declaration -> A.M_decl
transVar_declaration x = case x of
    Var_declaration1 basicvardeclaration -> A.M_var (transBasic_var_declaration basicvardeclaration)

transBasic_var_declaration :: Basic_var_declaration -> (String, A.M_type)
transBasic_var_declaration x = case x of
    Basic_var_declaration1 identifier type_ -> (transIdentifier identifier, transType type_)

transFun_declaration :: Fun_declaration -> A.M_decl
transFun_declaration x = case x of
    Fun_declaration1 identifier paramlist type_ funblock -> A.M_fun (transIdentifier identifier, transParam_list paramlist, transType type_, transFun_block funblock)

transFun_block :: Fun_block -> A.M_prog
transFun_block x = case x of
    Fun_block1 declarations funbody -> A.M_prog (transDeclarations declarations, transFun_body funbody)

transParam_list :: Param_list -> [(String, A.M_type)]
transParam_list x = case x of
    Param_list1 parameters -> transParameters parameters

transParameters :: Parameters -> [(String, A.M_type)]
transParameters x = case x of
    ParametersParameters1 parameters -> transParameters parameters
    Parameters1 -> []
    Parameters11 parameters basicvardeclaration -> (transParameters parameters)++[transBasic_var_declaration basicvardeclaration]
    Parameters1Basic_var_declaration basicvardeclaration -> [transBasic_var_declaration basicvardeclaration]

transIdentifier :: Identifier -> String
transIdentifier x = case x of
    IdentifierID id -> transID id

transType :: Type -> A.M_type
transType x = case x of
    Type_int -> A.M_int
    Type_bool -> A.M_bool

transProgram_body :: Program_body -> [A.M_stmt]
transProgram_body x = case x of
    Program_body1 progstmts -> transProg_stmts progstmts

transFun_body :: Fun_body -> [A.M_stmt]
transFun_body x = case x of
    Fun_body1 progstmts expr -> (transProg_stmts progstmts)++[A.M_return (transExpr expr)]

transProg_stmts :: Prog_stmts -> [A.M_stmt]
transProg_stmts x = case x of
    Prog_stmts1 progstmt progstmts -> (transProg_stmt progstmt):(transProg_stmts progstmts)
    Prog_stmts2 -> []

transProg_stmt :: Prog_stmt -> A.M_stmt
transProg_stmt x = case x of
    Prog_stmt1 expr progstmt1 progstmt2 -> A.M_cond (transExpr expr, transProg_stmt progstmt1, transProg_stmt progstmt2)
    Prog_stmt2 expr progstmt -> A.M_while (transExpr expr, transProg_stmt progstmt)
    Prog_stmt3 id -> A.M_read (transID id)
    Prog_stmt4 id expr -> A.M_ass (transID id, transExpr expr)
    Prog_stmt5 expr -> A.M_print (transExpr expr)
    Prog_stmt6 block -> A.M_block (transBlock block)

transExpr :: Expr -> A.M_expr
transExpr x = case x of
    Expr1 expr bintterm -> A.M_app (A.M_or, [transExpr expr, transBint_term bintterm])
    ExprBint_term bintterm -> transBint_term bintterm

transBint_term :: Bint_term -> A.M_expr
transBint_term x = case x of
    Bint_term1 bintterm bintfactor -> A.M_app (A.M_and, [transBint_term bintterm, transBint_factor bintfactor])
    Bint_termBint_factor bintfactor -> transBint_factor bintfactor

transBint_factor :: Bint_factor -> A.M_expr
transBint_factor x = case x of
    Bint_factor1 bintfactor -> transBint_factor bintfactor
    Bint_factor2 intexpr1 compareop intexpr2 -> A.M_app (transCompare_op compareop, [transInt_expr intexpr1, transInt_expr intexpr2])
    Bint_factorInt_expr intexpr -> transInt_expr intexpr

transCompare_op :: Compare_op -> A.M_operation
transCompare_op x = case x of
    Compare_op1 -> A.M_eq
    Compare_op2 -> A.M_lt
    Compare_op3 -> A.M_gt
    Compare_op4 -> A.M_le
    Compare_op5 -> A.M_ge

transInt_expr :: Int_expr -> A.M_expr
transInt_expr x = case x of
    Int_expr1 intexpr addop intterm -> A.M_app(transAddop addop, [transInt_expr intexpr, transInt_term intterm])
    Int_exprInt_term intterm -> transInt_term intterm

transAddop :: Addop -> A.M_operation
transAddop x = case x of
    Addop1 -> A.M_add
    Addop2 -> A.M_sub

transInt_term :: Int_term -> A.M_expr
transInt_term x = case x of
    Int_term1 intterm mulop intfactor -> A.M_app(transMulop mulop, [transInt_term intterm, transInt_factor intfactor])
    Int_termInt_factor intfactor -> transInt_factor intfactor

transMulop :: Mulop -> A.M_operation
transMulop x = case x of
    Mulop1 -> A.M_mul
    Mulop2 -> A.M_div

transInt_factor :: Int_factor -> A.M_expr
transInt_factor x = case x of
    Int_factor1 expr -> transExpr expr
    Int_factor2 id argumentlist 
        | args == [] -> A.M_id (transID id)
        | otherwise  -> A.M_app ((A.M_fn (transID id)), args)
        where args = transArgument_list argumentlist
    Int_factorIVAL ival -> A.M_num (transIVAL ival)
    Int_factorBVAL bval -> A.M_bl (transBVAL bval)
    Int_factor3 intfactor -> A.M_app (A.M_neg, [transInt_factor intfactor])

transArgument_list :: Argument_list -> [A.M_expr]
transArgument_list x = case x of
    Argument_list1 arguments -> transArguments arguments
    Argument_list2 -> []

transArguments :: Arguments -> [A.M_expr]
transArguments x = case x of
    ArgumentsArguments1 arguments -> transArguments arguments
    Arguments1 -> []
    Arguments11 arguments expr -> (transArguments arguments)++[transExpr expr]
    Arguments1Expr expr -> [transExpr expr]

