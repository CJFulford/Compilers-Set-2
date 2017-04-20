module StackConv where

import IR

-- to remove the extra new lines that unline adds
toSingleString:: [String] -> String
toSingleString [] = ""
toSingleString (s:[]) = s
toSingleString ("":st) = toSingleString st
toSingleString (s:st) = s ++ "\n" ++ toSingleString st

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- generate code for program
stackI_prog::I_prog -> String
stackI_prog (I_prog(funcList, localVars, stmtList)) = toSingleString [
    "\tLOAD_R %sp               % access pointer for program",
    "\tLOAD_R %sp               % set the frame pointer for prog",
    "\tSTORE_R %fp",
    "\tALLOC " ++ show localVars,
    stackStmts stmtList,
    "\tALLOC " ++ (show (-localVars - length(funcList))),
    "\tHALT",
    stackFBodys funcList]

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- generate code for list of functions
stackFBodys::[I_fbody] -> String
stackFBodys [] = ""
stackFBodys (f:[]) = stackFBody f
stackFBodys (f:fs) = toSingleString [
    stackFBody f,
    stackFBodys fs]
    
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- generate code for a single function
stackFBody::I_fbody -> String
stackFBody (I_fun(label, funcList, localArgs, localVars, stmtList)) = toSingleString [
    label ++ ":",
    "\tLOAD_R %sp",
    "\tSTORE_R %fp                    % set new %fp to top stack element",
    "\tALLOC " ++ show localVars,
    "\tLOAD_I " ++ (show (-(localVars + 2))) ++ "                        % set deallocation counter",
    stackStmts stmtList,
    stackFBodys funcList,
    -- code after loading return expression
    "\tLOAD_R %fp                   % load frame pointers",
    "\tSTORE_O " ++ (show (-(localArgs + 3))) ++ "                 % store <result> in first argument slot",
    "\tLOAD_R %fp                   % load frame pointer",
    "\tLOAD_O 0                     % load <return>",
    "\tLOAD_R %fp",
    "\tSTORE_O " ++ (show (-(localArgs + 2))) ++ "                 % place <return> below <result>",
    "\tLOAD_R %fp",
    "\tLOAD_O " ++ (show (localVars + 1)) ++ "                  % retrieve the deallocation pointer",
    "\tALLOC_S ",
    "\tSTORE_R %fp                  % restore old frame pointer",
    "\tALLOC " ++ (show (-localArgs)) ++ "                   % remove arguments - 2 for return pointer and result",
    "\tJUMP_S                       % jump to top of stack code address"]

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- generate code for list of statements
stackStmts::[I_stmt] -> String
stackStmts [] = ""
stackStmts (s:[]) = stackStmt s
stackStmts (s:ss) = toSingleString[
    stackStmt s, 
    stackStmts ss]

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- generate code for single statement
stackStmt::I_stmt -> String
--I_ass
stackStmt (I_ass(0, offset, expr)) = toSingleString [
    stackExpr expr,
    "\tLOAD_R %fp", 
    "\tSTORE_O " ++ show offset]
stackStmt (I_ass(level, offset, expr)) = toSingleString [
    stackStmt (I_ass(level-1, offset, expr)),
    "\tLOAD_R %fp", 
    "\tLOAD_O -2"]
-- I_while
stackStmt (I_while(expr, stmt)) = toSingleString [
    stackExpr expr, 
    stackStmt stmt]
-- I_cond
stackStmt (I_cond(expr, ifStmt, elseStmt)) = toSingleString [
    stackExpr expr, 
    "\tJUMP_C if_label",
    stackStmt ifStmt,
    "\tJUMP_C finish_label",
    "if_label:", 
    stackStmt elseStmt, 
    "finish_label: "]
-- I_read_I
stackStmt (I_read_I(0, offset)) = toSingleString [
    "\tREAD_I                    % read and store",
    "\tLOAD_R %fp",
    "\tSTORE_O " ++ show offset]
stackStmt (I_read_I(level, offset)) = toSingleString [
    "\tLOAD_R %fp", 
    "\tLOAD_O 2", 
    stackStmt (I_read_I(level-1, offset))]
-- I_read_B
stackStmt (I_read_B(0, offset)) = toSingleString [
    "\tREAD_B                    % read and store",
    "\tLOAD_R %fp",
    "\tSTORE_O " ++ show offset]
stackStmt (I_read_B(level, offset)) = toSingleString [
    "\tLOAD_R %fp", 
    "\tLOAD_O -2", 
    stackStmt (I_read_I(level-1, offset))]
-- I_print_I
stackStmt (I_print_I expr) = toSingleString [
    stackExpr expr, 
    "\tPRINT_I"]
-- I_print B
stackStmt (I_print_B expr) = toSingleString [
    stackExpr expr, 
    "\tPRINT_B"]
-- I_return
stackStmt (I_return expr) = stackExpr expr
-- I_block
stackStmt (I_block(funcList, localVars, stmtList)) = toSingleString [
    "\tLOAD_R %fp",
    "\tALLOC 2",
    "\tLOAD_R %sp",
    "\tSTORE_R %fp",
    "\tALLOC " ++ (show localVars),
    "\tLOAD_I " ++ (show (localVars + 3)),
    stackStmts stmtList,
    stackFBodys funcList,
    "\tLOAD_R %fp",
    "\tLOAD_O " ++ (show (localVars + 1)),
    "\tAPP NEG",
    "\tALLOC_S",
    "\tSTORE_R %fp"]

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- generate code from list of expressions
stackExprs::[I_expr] -> String
stackExprs [] = ""
stackExprs (e:[]) = stackExpr e
stackExprs (e:es) = toSingleString [
    stackExpr e, 
    stackExprs es]

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- geneate code from single expression
stackExpr:: I_expr -> String
-- I_num
stackExpr (I_num x) = "\tLOAD_I " ++ (show x)
-- I_bool
stackExpr (I_bool x) = 
    if x
    then "\tLOAD_I 1"
    else "\tLOAD_I 2"
-- I_id
stackExpr (I_id(0, offset)) = toSingleString[
    "\tLOAD_R %fp",
    "\tLOAD_O " ++ show offset]
stackExpr (I_id(level, offset)) = toSingleString [
    "\tLOAD_R %fp",
    "\tLOAD_O -2", 
    stackExpr (I_id(level-1, offset))] 
-- I_app
stackExpr (I_app (op, exprs)) = toSingleString[
    stackExprs exprs,
    stackOp op]

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- generate code for operations
stackOp :: I_opn -> String
stackOp I_add = "\tAPP ADD"
stackOp I_sub = "\tAPP SUB"
stackOp I_mul = "\tAPP MUL"
stackOp I_div = "\tAPP DIV"
stackOp I_neg = "\tAPP NEG"

stackOp I_lt = "\tAPP LT"
stackOp I_le = "\tAPP LE"
stackOp I_gt = "\tAPP GT"
stackOp I_ge = "\tAPP GE"
stackOp I_eq = "\tAPP EQ"

stackOp I_not = "\tAPP NOT"
stackOp I_and = "\tAPP ADD"
stackOp I_or = "\tAPP OR"

stackOp (I_call(label, 0)) = toSingleString [
    "\tALLOC 1                   % void on stack for return value",
    "\tLOAD_R %fp                % static link",     
    "\tLOAD_R %fp                % dynamic link",
    "\tLOAD_R %cp                % save program counter",
    "\tJUMP " ++ label ++ "                % call function"]
stackOp (I_call(label, level)) = toSingleString [
    "\tLOAD_R %fp",
    "\tLOAD_O 2",
    stackOp (I_call(label, level-1))]