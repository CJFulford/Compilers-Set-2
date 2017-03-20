{-# OPTIONS_GHC -w #-}
{-# OPTIONS -fglasgow-exts -cpp #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParM where
import AbsM
import LexM
import ErrM
import qualified Data.Array as Happy_Data_Array
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
happyIn51 :: (Integer) -> (HappyAbsSyn )
happyIn51 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn51 #-}
happyOut51 :: (HappyAbsSyn ) -> (Integer)
happyOut51 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut51 #-}
happyIn52 :: (Double) -> (HappyAbsSyn )
happyIn52 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn52 #-}
happyOut52 :: (HappyAbsSyn ) -> (Double)
happyOut52 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut52 #-}
happyIn53 :: (Char) -> (HappyAbsSyn )
happyIn53 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn53 #-}
happyOut53 :: (HappyAbsSyn ) -> (Char)
happyOut53 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut53 #-}
happyIn54 :: (CID) -> (HappyAbsSyn )
happyIn54 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn54 #-}
happyOut54 :: (HappyAbsSyn ) -> (CID)
happyOut54 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut54 #-}
happyIn55 :: (ID) -> (HappyAbsSyn )
happyIn55 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn55 #-}
happyOut55 :: (HappyAbsSyn ) -> (ID)
happyOut55 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut55 #-}
happyIn56 :: (Prog) -> (HappyAbsSyn )
happyIn56 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn56 #-}
happyOut56 :: (HappyAbsSyn ) -> (Prog)
happyOut56 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut56 #-}
happyIn57 :: (Block) -> (HappyAbsSyn )
happyIn57 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn57 #-}
happyOut57 :: (HappyAbsSyn ) -> (Block)
happyOut57 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut57 #-}
happyIn58 :: (Declarations) -> (HappyAbsSyn )
happyIn58 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn58 #-}
happyOut58 :: (HappyAbsSyn ) -> (Declarations)
happyOut58 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut58 #-}
happyIn59 :: (Declaration) -> (HappyAbsSyn )
happyIn59 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn59 #-}
happyOut59 :: (HappyAbsSyn ) -> (Declaration)
happyOut59 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut59 #-}
happyIn60 :: (Var_declaration) -> (HappyAbsSyn )
happyIn60 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn60 #-}
happyOut60 :: (HappyAbsSyn ) -> (Var_declaration)
happyOut60 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut60 #-}
happyIn61 :: (Var_specs) -> (HappyAbsSyn )
happyIn61 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn61 #-}
happyOut61 :: (HappyAbsSyn ) -> (Var_specs)
happyOut61 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut61 #-}
happyIn62 :: (More_var_specs) -> (HappyAbsSyn )
happyIn62 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn62 #-}
happyOut62 :: (HappyAbsSyn ) -> (More_var_specs)
happyOut62 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut62 #-}
happyIn63 :: (Var_spec) -> (HappyAbsSyn )
happyIn63 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn63 #-}
happyOut63 :: (HappyAbsSyn ) -> (Var_spec)
happyOut63 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut63 #-}
happyIn64 :: (Array_dimensions) -> (HappyAbsSyn )
happyIn64 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn64 #-}
happyOut64 :: (HappyAbsSyn ) -> (Array_dimensions)
happyOut64 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut64 #-}
happyIn65 :: (Type) -> (HappyAbsSyn )
happyIn65 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn65 #-}
happyOut65 :: (HappyAbsSyn ) -> (Type)
happyOut65 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut65 #-}
happyIn66 :: (Fun_declaration) -> (HappyAbsSyn )
happyIn66 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn66 #-}
happyOut66 :: (HappyAbsSyn ) -> (Fun_declaration)
happyOut66 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut66 #-}
happyIn67 :: (Fun_block) -> (HappyAbsSyn )
happyIn67 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn67 #-}
happyOut67 :: (HappyAbsSyn ) -> (Fun_block)
happyOut67 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut67 #-}
happyIn68 :: (Param_list) -> (HappyAbsSyn )
happyIn68 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn68 #-}
happyOut68 :: (HappyAbsSyn ) -> (Param_list)
happyOut68 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut68 #-}
happyIn69 :: (Parameters) -> (HappyAbsSyn )
happyIn69 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn69 #-}
happyOut69 :: (HappyAbsSyn ) -> (Parameters)
happyOut69 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut69 #-}
happyIn70 :: (More_parameters) -> (HappyAbsSyn )
happyIn70 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn70 #-}
happyOut70 :: (HappyAbsSyn ) -> (More_parameters)
happyOut70 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut70 #-}
happyIn71 :: (Basic_declaration) -> (HappyAbsSyn )
happyIn71 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn71 #-}
happyOut71 :: (HappyAbsSyn ) -> (Basic_declaration)
happyOut71 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut71 #-}
happyIn72 :: (Basic_array_dimensions) -> (HappyAbsSyn )
happyIn72 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn72 #-}
happyOut72 :: (HappyAbsSyn ) -> (Basic_array_dimensions)
happyOut72 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut72 #-}
happyIn73 :: (Data_declaration) -> (HappyAbsSyn )
happyIn73 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn73 #-}
happyOut73 :: (HappyAbsSyn ) -> (Data_declaration)
happyOut73 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut73 #-}
happyIn74 :: (Cons_declarations) -> (HappyAbsSyn )
happyIn74 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn74 #-}
happyOut74 :: (HappyAbsSyn ) -> (Cons_declarations)
happyOut74 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut74 #-}
happyIn75 :: (More_cons_decl) -> (HappyAbsSyn )
happyIn75 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn75 #-}
happyOut75 :: (HappyAbsSyn ) -> (More_cons_decl)
happyOut75 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut75 #-}
happyIn76 :: (Cons_decl) -> (HappyAbsSyn )
happyIn76 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn76 #-}
happyOut76 :: (HappyAbsSyn ) -> (Cons_decl)
happyOut76 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut76 #-}
happyIn77 :: (Type_list) -> (HappyAbsSyn )
happyIn77 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn77 #-}
happyOut77 :: (HappyAbsSyn ) -> (Type_list)
happyOut77 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut77 #-}
happyIn78 :: (More_type) -> (HappyAbsSyn )
happyIn78 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn78 #-}
happyOut78 :: (HappyAbsSyn ) -> (More_type)
happyOut78 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut78 #-}
happyIn79 :: (Program_body) -> (HappyAbsSyn )
happyIn79 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn79 #-}
happyOut79 :: (HappyAbsSyn ) -> (Program_body)
happyOut79 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut79 #-}
happyIn80 :: (Fun_body) -> (HappyAbsSyn )
happyIn80 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn80 #-}
happyOut80 :: (HappyAbsSyn ) -> (Fun_body)
happyOut80 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut80 #-}
happyIn81 :: (Prog_stmts) -> (HappyAbsSyn )
happyIn81 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn81 #-}
happyOut81 :: (HappyAbsSyn ) -> (Prog_stmts)
happyOut81 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut81 #-}
happyIn82 :: (Prog_stmt) -> (HappyAbsSyn )
happyIn82 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn82 #-}
happyOut82 :: (HappyAbsSyn ) -> (Prog_stmt)
happyOut82 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut82 #-}
happyIn83 :: (Location) -> (HappyAbsSyn )
happyIn83 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn83 #-}
happyOut83 :: (HappyAbsSyn ) -> (Location)
happyOut83 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut83 #-}
happyIn84 :: (Case_list) -> (HappyAbsSyn )
happyIn84 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn84 #-}
happyOut84 :: (HappyAbsSyn ) -> (Case_list)
happyOut84 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut84 #-}
happyIn85 :: (More_case) -> (HappyAbsSyn )
happyIn85 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn85 #-}
happyOut85 :: (HappyAbsSyn ) -> (More_case)
happyOut85 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut85 #-}
happyIn86 :: (Case) -> (HappyAbsSyn )
happyIn86 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn86 #-}
happyOut86 :: (HappyAbsSyn ) -> (Case)
happyOut86 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut86 #-}
happyIn87 :: (Var_list) -> (HappyAbsSyn )
happyIn87 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn87 #-}
happyOut87 :: (HappyAbsSyn ) -> (Var_list)
happyOut87 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut87 #-}
happyIn88 :: (Var_list) -> (HappyAbsSyn )
happyIn88 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn88 #-}
happyOut88 :: (HappyAbsSyn ) -> (Var_list)
happyOut88 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut88 #-}
happyIn89 :: (More_var_list) -> (HappyAbsSyn )
happyIn89 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn89 #-}
happyOut89 :: (HappyAbsSyn ) -> (More_var_list)
happyOut89 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut89 #-}
happyIn90 :: (Expr) -> (HappyAbsSyn )
happyIn90 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn90 #-}
happyOut90 :: (HappyAbsSyn ) -> (Expr)
happyOut90 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut90 #-}
happyIn91 :: (Bint_term) -> (HappyAbsSyn )
happyIn91 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn91 #-}
happyOut91 :: (HappyAbsSyn ) -> (Bint_term)
happyOut91 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut91 #-}
happyIn92 :: (Bint_factor) -> (HappyAbsSyn )
happyIn92 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn92 #-}
happyOut92 :: (HappyAbsSyn ) -> (Bint_factor)
happyOut92 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut92 #-}
happyIn93 :: (Compare_op) -> (HappyAbsSyn )
happyIn93 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn93 #-}
happyOut93 :: (HappyAbsSyn ) -> (Compare_op)
happyOut93 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut93 #-}
happyIn94 :: (Int_expr) -> (HappyAbsSyn )
happyIn94 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn94 #-}
happyOut94 :: (HappyAbsSyn ) -> (Int_expr)
happyOut94 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut94 #-}
happyIn95 :: (Addop) -> (HappyAbsSyn )
happyIn95 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn95 #-}
happyOut95 :: (HappyAbsSyn ) -> (Addop)
happyOut95 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut95 #-}
happyIn96 :: (Int_term) -> (HappyAbsSyn )
happyIn96 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn96 #-}
happyOut96 :: (HappyAbsSyn ) -> (Int_term)
happyOut96 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut96 #-}
happyIn97 :: (Mulop) -> (HappyAbsSyn )
happyIn97 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn97 #-}
happyOut97 :: (HappyAbsSyn ) -> (Mulop)
happyOut97 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut97 #-}
happyIn98 :: (Int_factor) -> (HappyAbsSyn )
happyIn98 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn98 #-}
happyOut98 :: (HappyAbsSyn ) -> (Int_factor)
happyOut98 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut98 #-}
happyIn99 :: (Modifier_list) -> (HappyAbsSyn )
happyIn99 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn99 #-}
happyOut99 :: (HappyAbsSyn ) -> (Modifier_list)
happyOut99 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut99 #-}
happyIn100 :: (Fun_argument_list) -> (HappyAbsSyn )
happyIn100 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn100 #-}
happyOut100 :: (HappyAbsSyn ) -> (Fun_argument_list)
happyOut100 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut100 #-}
happyIn101 :: (Cons_argument_list) -> (HappyAbsSyn )
happyIn101 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn101 #-}
happyOut101 :: (HappyAbsSyn ) -> (Cons_argument_list)
happyOut101 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut101 #-}
happyIn102 :: (Arguments) -> (HappyAbsSyn )
happyIn102 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn102 #-}
happyOut102 :: (HappyAbsSyn ) -> (Arguments)
happyOut102 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut102 #-}
happyIn103 :: (More_arguments) -> (HappyAbsSyn )
happyIn103 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn103 #-}
happyOut103 :: (HappyAbsSyn ) -> (More_arguments)
happyOut103 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut103 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\xf9\x00\xf9\x00\xf9\x00\xf9\x00\xb1\x02\xc0\x02\xb2\x02\xbd\x02\xbd\x02\xb3\x01\x95\x02\xf9\x00\xb0\x02\xaf\x02\xae\x02\xab\x02\xa9\x02\x98\x02\x9f\x02\xa4\x02\x9c\x02\xb3\x01\xac\x02\xd0\x01\xcd\x01\xe3\x01\xe3\x01\x9a\x02\x99\x02\x9d\x02\x90\x02\xad\x02\x97\x02\xa7\x02\xff\xff\xff\xff\xff\xff\x51\x02\x0e\x00\x02\x01\x0e\x00\xfa\x00\x0e\x00\x24\x01\xaa\x02\xaa\x02\xff\xff\xa5\x02\x96\x02\x00\x00\x94\x02\xff\xff\x00\x00\x00\x00\x00\x00\xa8\x02\x24\x01\xfe\xff\xa6\x02\x00\x00\x4b\x02\xfa\x00\x00\x00\x93\x02\xff\xff\x0e\x00\xa3\x02\x00\x00\xa2\x02\xa1\x02\xff\xff\xa0\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x92\x02\xff\xff\x92\x02\x00\x00\x92\x02\x00\x00\xff\xff\x92\x02\x92\x02\x00\x00\x00\x00\x0f\x00\x92\x02\x00\x00\x00\x00\x08\x00\x92\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x92\x02\x01\x00\x97\x00\x92\x02\x91\x02\x9b\x02\x8f\x02\x8f\x02\x8e\x02\x9e\x02\x8c\x02\x8c\x02\x8d\x02\x8a\x02\x87\x02\x89\x02\x86\x02\x86\x02\x88\x02\xff\xff\xff\xff\xff\xff\x84\x02\xff\xff\xf9\x00\x80\x02\x85\x02\x77\x02\x81\x02\xe3\x01\x71\x02\x00\x00\xe3\x01\x71\x02\xb3\x01\x00\x00\x8b\x02\x6f\x02\x00\x00\x00\x00\x00\x00\x00\x00\x76\x02\x68\x02\x68\x02\x57\x02\x67\x02\x6e\x02\x65\x02\x63\x02\x61\x02\x83\x02\x7f\x02\x60\x02\x60\x02\x5f\x02\x5d\x02\x82\x02\x5c\x02\x58\x02\xcd\x01\x7a\x02\x00\x00\x00\x00\x56\x02\x00\x00\x55\x02\x74\x02\x53\x02\x53\x02\x53\x02\x53\x02\x00\x00\x53\x02\x72\x02\x52\x02\x7d\x02\x50\x02\x50\x02\x50\x02\x50\x02\xb1\x01\x50\x02\x00\x00\x00\x00\x00\x00\x7b\x02\x79\x02\x7e\x02\xf9\x00\x00\x00\x7c\x02\x00\x00\x78\x02\x73\x02\x69\x02\x70\x02\x00\x00\x4e\x02\xb3\x01\x00\x00\x75\x02\x59\x02\x4f\x02\xff\xff\xe3\x01\x47\x02\x26\x01\x00\x00\x46\x02\x66\x01\xd0\x00\xff\xff\x00\x00\x00\x00\x45\x02\x64\x02\x6d\x02\x00\x00\x6c\x02\xff\xff\xff\xff\x0e\x00\x0e\x00\xf9\xff\x6b\x02\x3b\x02\x00\x00\xff\xff\xff\xff\xff\xff\x00\x00\x1e\x00\x0e\x00\x00\x00\x00\x00\x00\x00\xfe\xff\x00\x00\x02\x01\x00\x00\x1d\x00\x1c\x00\x15\x00\x5b\x02\x00\x00\x5a\x02\x00\x00\xfa\x00\x00\x00\x6a\x02\x00\x00\x00\x00\xe3\x01\x00\x00\x3a\x02\x41\x02\xe3\x01\xe3\x01\x00\x00\x00\x00\x4c\x00\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x34\x02\x00\x00\xb3\x01\x00\x00\x00\x00\x00\x00\x5e\x02\xb3\x01\x00\x00\x00\x00\xb3\x01\x00\x00\x00\x00\x25\x00\x00\x00\x00\x00\x4d\x02\x31\x02\x00\x00\x00\x00\x62\x02\x00\x00\x00\x00\x00\x00\x00\x00\x32\x02\xe3\x01\x3e\x02\x36\x02\xf9\x00\x00\x00\x00\x00\x00\x00\x2f\x02\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x0d\x02\x21\x02\x40\x02\x3c\x01\x4c\x02\x22\x02\x49\x02\x0e\x02\x44\x02\xd4\x01\x3f\x02\x2d\x02\x3c\x02\x49\x01\x38\x02\x07\x01\x35\x02\x2c\x02\x5c\x00\x29\x02\xf7\x00\x9f\x01\x24\x02\xae\x01\xce\x00\xe1\x01\xf8\x01\x9e\x00\x94\x00\x19\x02\x6e\x00\x1a\x02\x60\x00\x12\x02\x3a\x01\x72\x01\x81\x01\xe5\x01\x8b\x01\xff\x01\xc0\x01\xf3\x01\xf5\x00\x5e\x00\xd9\x01\xdc\x01\x47\x00\xd3\x01\x00\x00\x00\x00\x00\x00\x31\x01\x00\x00\x00\x00\x00\x00\xba\x01\xf6\xff\xce\x01\x00\x00\x00\x00\xaf\x01\xd7\x01\x00\x00\x00\x00\x28\x01\xaa\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7c\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x1f\x01\x00\x00\x00\x00\x00\x00\x00\x00\xd7\x01\x00\x00\x00\x00\x00\x00\xb4\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf0\x01\xb7\x01\x00\x00\x00\x00\x0a\x00\xad\x01\x00\x00\x00\x00\x5b\x00\x00\x00\xb2\x01\xb9\x01\x00\x00\x00\x00\x00\x00\xef\x00\xe6\x00\xdd\x00\x9c\x00\xd4\x00\x17\x02\x00\x00\x00\x00\x00\x00\x00\x00\x19\x01\x00\x00\x00\x00\x10\x01\x00\x00\xc5\x01\x00\x00\x9c\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x96\x00\x00\x00\x97\x01\x00\x00\xa4\x01\x00\x00\x00\x00\x87\x01\x00\x00\x00\x00\x10\x00\x00\x00\x7e\x01\x00\x00\x54\x00\xc5\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6d\x01\x18\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x05\x00\x00\x00\x8d\x01\x00\x00\x00\x00\x00\x00\x00\x00\x23\x01\x00\x00\x00\x00\x00\x00\x00\x00\x5d\x01\x00\x00\x55\x01\x3d\x02\x00\x00\x00\x00\x00\x00\x51\x01\x00\x00\x34\x01\x00\x00\x00\x00\x47\x01\x52\x00\x00\x00\x12\x01\x00\x00\x00\x00\xa4\x00\xbc\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9b\x00\x00\x00\x00\x00\xae\x00\x00\x00\x00\x00\x00\x00\x72\x00\x6a\x01\x77\x01\xbb\x01\x07\x00\x00\x00\x00\x00\xc1\x00\x00\x00\x92\x00\x89\x00\x59\x00\x00\x00\x00\x00\x86\x01\x00\x00\x00\x00\x00\x00\x53\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x00\x00\x55\x00\x00\x00\x16\x00\x00\x00\xec\xff\x00\x00\x00\x00\x00\x00\x00\x00\xec\x01\x00\x00\x00\x00\x00\x00\xd8\x01\xb0\x01\x00\x00\x00\x00\x00\x00\x50\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x90\x01\x00\x00\x00\x00\x00\x00\x00\x00\xa5\x00\x00\x00\x00\x00\x8c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x50\x01\x00\x00\x00\x00\x2a\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\xc7\xff\xc7\xff\xc7\xff\x00\x00\x00\x00\xbd\xff\xc0\xff\xbd\xff\xbd\xff\x00\x00\x00\x00\xc7\xff\x00\x00\xb3\xff\xb1\xff\x00\x00\xae\xff\x00\x00\x00\x00\xaa\xff\x00\x00\x00\x00\xa5\xff\x9f\xff\x9f\xff\x9f\xff\x00\x00\x00\x00\x00\x00\x94\xff\x00\x00\x91\xff\x00\x00\x8e\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbd\xff\x00\x00\x68\xff\x66\xff\x64\xff\x00\x00\xcf\xff\x00\x00\x00\x00\x72\xff\x71\xff\x6e\xff\x68\xff\xbd\xff\x64\xff\x8c\xff\x8a\xff\x87\xff\x80\xff\x7c\xff\x00\x00\x00\x00\x00\x00\x00\x00\x6f\xff\x00\x00\x00\x00\x00\x00\x00\x00\x70\xff\xce\xff\xcd\xff\xcc\xff\xcb\xff\x69\xff\x00\x00\x66\xff\x00\x00\x6b\xff\x00\x00\x6c\xff\x00\x00\x00\x00\x00\x00\x7b\xff\x7a\xff\x00\x00\x00\x00\x7f\xff\x7e\xff\x00\x00\x00\x00\x85\xff\x86\xff\x83\xff\x84\xff\x82\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8e\xff\x00\x00\x00\x00\x00\x00\x91\xff\x00\x00\x00\x00\x00\x00\x00\x00\x94\xff\xbd\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc7\xff\x00\x00\x00\x00\x00\x00\x00\x00\x9f\xff\x00\x00\xa3\xff\x9f\xff\x00\x00\x00\x00\xb8\xff\xa5\xff\x00\x00\xba\xff\xb9\xff\xbc\xff\xbb\xff\xa8\xff\x00\x00\x00\x00\x00\x00\x00\x00\xaa\xff\x00\x00\x00\x00\x00\x00\x00\x00\xae\xff\x00\x00\x00\x00\x00\x00\x00\x00\xb1\xff\x00\x00\xb3\xff\x9f\xff\x00\x00\xc6\xff\xc5\xff\x00\x00\xc4\xff\x00\x00\xbd\xff\x00\x00\x00\x00\x00\x00\x00\x00\xbf\xff\x00\x00\xbd\xff\x00\x00\xc0\xff\x00\x00\x00\x00\x00\x00\x00\x00\x9f\xff\x00\x00\xca\xff\xc9\xff\xc2\xff\xc0\xff\x00\x00\x00\x00\xc7\xff\xb6\xff\x00\x00\xb4\xff\xb1\xff\x00\x00\xae\xff\x00\x00\xac\xff\xaa\xff\x00\x00\xa7\xff\xa5\xff\x00\x00\x00\x00\x00\x00\x9f\xff\x00\x00\x00\x00\x9c\xff\x9a\xff\x00\x00\x00\x00\x00\x00\x97\xff\x96\xff\x94\xff\x00\x00\x00\x00\x90\xff\x8e\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x89\xff\x00\x00\x00\x00\x00\x00\x6d\xff\x00\x00\x00\x00\x67\xff\x74\xff\x73\xff\x64\xff\x65\xff\x88\xff\x79\xff\x00\x00\x00\x00\x00\x00\xae\xff\x6a\xff\xbd\xff\x7d\xff\x81\xff\x8b\xff\x8d\xff\x8f\xff\x92\xff\x00\x00\x95\xff\x9b\xff\x00\x00\x00\x00\x00\x00\x99\xff\xa0\xff\x00\x00\x00\x00\xa4\xff\xa6\xff\xa9\xff\xab\xff\x00\x00\xaf\xff\x00\x00\xb2\xff\xb5\xff\xc8\xff\x00\x00\x00\x00\xc1\xff\xc3\xff\x00\x00\xb0\xff\xad\xff\x00\x00\xa1\xff\x9d\xff\x00\x00\x00\x00\x93\xff\xbe\xff\x00\x00\x76\xff\x77\xff\x75\xff\x78\xff\x00\x00\x00\x00\x00\x00\x00\x00\xc7\xff\xa2\xff\x9e\xff\x98\xff\x00\x00\xb7\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x02\x00\x01\x00\x0d\x00\x06\x00\x03\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x13\x00\x05\x00\x04\x00\x07\x00\x02\x00\x0c\x00\x0d\x00\x04\x00\x04\x00\x07\x00\x17\x00\x08\x00\x03\x00\x17\x00\x2e\x00\x19\x00\x1d\x00\x1e\x00\x1f\x00\x03\x00\x03\x00\x03\x00\x23\x00\x0d\x00\x14\x00\x17\x00\x30\x00\x31\x00\x29\x00\x30\x00\x2b\x00\x1d\x00\x1e\x00\x1f\x00\x30\x00\x25\x00\x0b\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x2f\x00\x29\x00\x37\x00\x2b\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x37\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x30\x00\x37\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x30\x00\x30\x00\x30\x00\x2c\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x30\x00\x04\x00\x0b\x00\x04\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x03\x00\x03\x00\x0e\x00\x27\x00\x28\x00\x29\x00\x04\x00\x2b\x00\x12\x00\x2d\x00\x14\x00\x2f\x00\x15\x00\x0d\x00\x1a\x00\x33\x00\x27\x00\x28\x00\x29\x00\x03\x00\x2b\x00\x17\x00\x2d\x00\x19\x00\x2f\x00\x27\x00\x28\x00\x29\x00\x33\x00\x2b\x00\x30\x00\x2d\x00\x23\x00\x2f\x00\x27\x00\x28\x00\x29\x00\x03\x00\x2b\x00\x25\x00\x2d\x00\x34\x00\x2f\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x30\x00\x31\x00\x04\x00\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x03\x00\x26\x00\x03\x00\x0e\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x04\x00\x21\x00\x04\x00\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x04\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x19\x00\x27\x00\x28\x00\x29\x00\x0e\x00\x2b\x00\x21\x00\x2d\x00\x23\x00\x2f\x00\x27\x00\x28\x00\x29\x00\x20\x00\x2b\x00\x20\x00\x2d\x00\x04\x00\x2f\x00\x27\x00\x28\x00\x29\x00\x04\x00\x2b\x00\x30\x00\x2d\x00\x04\x00\x2f\x00\x27\x00\x28\x00\x29\x00\x37\x00\x2b\x00\x22\x00\x2d\x00\x04\x00\x2f\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x2f\x00\x1e\x00\x1f\x00\x20\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x24\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x03\x00\x27\x00\x28\x00\x29\x00\x04\x00\x2b\x00\x30\x00\x2d\x00\x08\x00\x2f\x00\x27\x00\x28\x00\x29\x00\x05\x00\x2b\x00\x07\x00\x2d\x00\x04\x00\x2f\x00\x27\x00\x28\x00\x29\x00\x19\x00\x2b\x00\x19\x00\x2d\x00\x04\x00\x2f\x00\x27\x00\x28\x00\x29\x00\x20\x00\x2b\x00\x14\x00\x2d\x00\x04\x00\x2f\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x2f\x00\x2c\x00\x02\x00\x04\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x1b\x00\x1e\x00\x1f\x00\x20\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x12\x00\x1e\x00\x1f\x00\x20\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x1c\x00\x1a\x00\x1e\x00\x1f\x00\x20\x00\x08\x00\x09\x00\x27\x00\x28\x00\x29\x00\x15\x00\x2b\x00\x0f\x00\x2d\x00\x04\x00\x2f\x00\x27\x00\x28\x00\x29\x00\x16\x00\x2b\x00\x04\x00\x2d\x00\x30\x00\x2f\x00\x27\x00\x28\x00\x29\x00\x12\x00\x2b\x00\x14\x00\x2d\x00\x18\x00\x2f\x00\x27\x00\x28\x00\x29\x00\x13\x00\x2b\x00\x11\x00\x2d\x00\x0b\x00\x2f\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x1f\x00\x20\x00\x04\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x2a\x00\x13\x00\x28\x00\x29\x00\x04\x00\x2b\x00\x30\x00\x2d\x00\x0b\x00\x2f\x00\x28\x00\x29\x00\x15\x00\x2b\x00\x0e\x00\x2d\x00\x29\x00\x2f\x00\x2b\x00\x04\x00\x2d\x00\x29\x00\x2f\x00\x2b\x00\x04\x00\x2d\x00\x29\x00\x2f\x00\x2b\x00\x0e\x00\x2d\x00\x18\x00\x2f\x00\x2b\x00\x04\x00\x2d\x00\x04\x00\x2f\x00\x2b\x00\x1b\x00\x2d\x00\x1a\x00\x2f\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x14\x00\x0d\x00\x16\x00\x15\x00\x04\x00\x1c\x00\x18\x00\x1e\x00\x1f\x00\x20\x00\x1f\x00\x20\x00\x24\x00\x21\x00\x0e\x00\x22\x00\x22\x00\x25\x00\x26\x00\x04\x00\x2a\x00\x27\x00\x2c\x00\x04\x00\x26\x00\x2d\x00\x2e\x00\x2c\x00\x14\x00\x0e\x00\x16\x00\x14\x00\x04\x00\x16\x00\x36\x00\x2d\x00\x36\x00\x2f\x00\x31\x00\x32\x00\x2d\x00\x21\x00\x2f\x00\x04\x00\x21\x00\x25\x00\x26\x00\x04\x00\x25\x00\x26\x00\x1f\x00\x20\x00\x16\x00\x2d\x00\x2e\x00\x04\x00\x2d\x00\x2e\x00\x1e\x00\x1f\x00\x20\x00\x34\x00\x36\x00\x21\x00\x2e\x00\x36\x00\x34\x00\x25\x00\x26\x00\x31\x00\x1f\x00\x20\x00\x31\x00\x32\x00\x2a\x00\x2d\x00\x2e\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x1f\x00\x20\x00\x36\x00\x0c\x00\x0d\x00\x0f\x00\x06\x00\x07\x00\x08\x00\x09\x00\x2e\x00\x0a\x00\x16\x00\x0c\x00\x0d\x00\x0f\x00\x06\x00\x07\x00\x08\x00\x09\x00\x2c\x00\x0a\x00\x16\x00\x0c\x00\x0d\x00\x0f\x00\x07\x00\x08\x00\x09\x00\x07\x00\x08\x00\x09\x00\x16\x00\x26\x00\x0f\x00\x10\x00\x22\x00\x0f\x00\x10\x00\x24\x00\x1b\x00\x16\x00\x18\x00\x16\x00\x16\x00\x07\x00\x08\x00\x09\x00\x07\x00\x08\x00\x09\x00\x15\x00\x13\x00\x0f\x00\x11\x00\x0f\x00\x0f\x00\x05\x00\x0d\x00\x07\x00\x16\x00\x0b\x00\x09\x00\x16\x00\x0c\x00\x0d\x00\x0e\x00\x1c\x00\x10\x00\x11\x00\x0c\x00\x0d\x00\x0e\x00\x31\x00\x10\x00\x11\x00\x31\x00\x2e\x00\x03\x00\x35\x00\x09\x00\x1b\x00\x35\x00\x30\x00\x01\x00\x12\x00\x12\x00\x03\x00\x2e\x00\x03\x00\x36\x00\x06\x00\x0f\x00\x2f\x00\x1c\x00\x30\x00\x28\x00\x31\x00\x04\x00\x0a\x00\x12\x00\x09\x00\x2f\x00\x06\x00\x03\x00\x02\x00\x06\x00\x09\x00\x06\x00\x12\x00\x0b\x00\x12\x00\x37\x00\x06\x00\x37\x00\x37\x00\x36\x00\x35\x00\x37\x00\x36\x00\x04\x00\x0b\x00\x12\x00\x0a\x00\x37\x00\x37\x00\x36\x00\x13\x00\x37\x00\x37\x00\x36\x00\x24\x00\x12\x00\x37\x00\x2f\x00\x37\x00\x37\x00\x02\x00\x06\x00\x02\x00\x02\x00\x02\x00\x02\x00\x37\x00\x01\x00\x37\x00\x28\x00\x02\x00\x06\x00\x02\x00\x06\x00\x37\x00\x02\x00\x04\x00\x19\x00\x02\x00\xff\xff\x06\x00\x20\x00\x2f\x00\x37\x00\x06\x00\xff\xff\x36\x00\x12\x00\xff\xff\x37\x00\xff\xff\xff\xff\xff\xff\x37\x00\x35\x00\x37\x00\x36\x00\x35\x00\x37\x00\x36\x00\x32\x00\x37\x00\x37\x00\x37\x00\x2f\x00\x36\x00\x35\x00\x12\x00\x36\x00\x35\x00\x12\x00\x2f\x00\x35\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x2c\x00\xff\xff\xff\xff\xff\xff\x36\x00\xff\xff\xff\xff\xff\xff\x36\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x41\x00\xde\x00\x51\x00\x34\x00\x8e\x00\x42\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xf7\x00\x5c\x00\x69\x00\x5d\x00\x41\x00\xba\x00\xac\x00\x58\x00\x98\x00\x42\x00\x43\x00\x59\x00\x21\x01\x17\x01\xdf\x00\x93\x00\x44\x00\x45\x00\x46\x00\x22\x01\x23\x01\xf1\x00\x47\x00\x1e\x01\xc1\x00\x43\x00\xeb\x00\x53\x00\x48\x00\xdd\x00\x49\x00\x44\x00\x45\x00\x46\x00\xdd\x00\xd9\x00\x27\x01\x32\x00\x4a\x00\x4b\x00\x4c\x00\x4d\x00\xf7\x00\x48\x00\xff\xff\x49\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x32\x00\x4a\x00\x4b\x00\x4c\x00\x4d\x00\xdd\x00\xff\xff\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xdd\x00\xdd\x00\xdd\x00\xde\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xdd\x00\x87\x00\x1a\x01\x98\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x6d\x00\x8e\x00\x88\x00\x39\x00\x3a\x00\x3b\x00\x69\x00\x3c\x00\xbf\x00\x3d\x00\x9d\x00\x3e\x00\x1f\x01\x51\x00\x09\x01\xe1\x00\x39\x00\x3a\x00\x3b\x00\x6d\x00\x3c\x00\x92\x00\x3d\x00\x93\x00\x3e\x00\x18\x01\x3a\x00\x3b\x00\x3f\x00\x3c\x00\xdd\x00\x3d\x00\xd7\x00\x3e\x00\xf1\x00\x3a\x00\x3b\x00\x6d\x00\x3c\x00\x6a\x00\x3d\x00\xee\x00\x3e\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x52\x00\x53\x00\x87\x00\x6e\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x6d\x00\xfb\x00\x8e\x00\x27\x01\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x73\x00\x24\x01\x73\x00\x72\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x87\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xc6\x00\xf2\x00\x3a\x00\x3b\x00\x14\x01\x3c\x00\x71\x00\x3d\x00\x72\x00\x3e\x00\xf3\x00\x3a\x00\x3b\x00\xd0\x00\x3c\x00\x74\x00\x3d\x00\x73\x00\x3e\x00\xff\x00\x3a\x00\x3b\x00\xf4\x00\x3c\x00\xdd\x00\x3d\x00\x73\x00\x3e\x00\x05\x01\x3a\x00\x3b\x00\xff\xff\x3c\x00\xfe\x00\x3d\x00\x73\x00\x3e\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xe7\x00\x04\x01\x7e\x00\x76\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xbe\x00\x80\x00\x7e\x00\x76\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x7f\x00\x80\x00\x7e\x00\x76\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x01\x01\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x8e\x00\xcf\x00\x3a\x00\x3b\x00\x58\x00\x3c\x00\xdd\x00\x3d\x00\x59\x00\x3e\x00\xd1\x00\x3a\x00\x3b\x00\x5c\x00\x3c\x00\x5d\x00\x3d\x00\x98\x00\x3e\x00\xd2\x00\x3a\x00\x3b\x00\x8f\x00\x3c\x00\x96\x00\x3d\x00\x73\x00\x3e\x00\xd3\x00\x3a\x00\x3b\x00\xa7\x00\x3c\x00\x99\x00\x3d\x00\x73\x00\x3e\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x55\x00\xa8\x00\x50\x00\x73\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x08\x01\xca\x00\x7e\x00\x76\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x55\x00\xcb\x00\x7e\x00\x76\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xb8\x00\x03\x01\x83\x00\x7e\x00\x76\x00\xb2\x00\xa2\x00\xe0\x00\x3a\x00\x3b\x00\x0c\x01\x3c\x00\xa3\x00\x3d\x00\x98\x00\x3e\x00\xe8\x00\x3a\x00\x3b\x00\xa5\x00\x3c\x00\x73\x00\x3d\x00\xdd\x00\x3e\x00\xed\x00\x3a\x00\x3b\x00\x9c\x00\x3c\x00\x9d\x00\x3d\x00\x0a\x01\x3e\x00\x66\x00\x3a\x00\x3b\x00\x0e\x01\x3c\x00\x11\x01\x3d\x00\x13\x01\x3e\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x2a\x01\x76\x00\xbc\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x02\x01\xc0\x00\xfa\x00\x3b\x00\x87\x00\x3c\x00\xdd\x00\x3d\x00\xb9\x00\x3e\x00\x65\x00\x3b\x00\xc2\x00\x3c\x00\x16\x01\x3d\x00\xf9\x00\x3e\x00\x3c\x00\x87\x00\x3d\x00\xe3\x00\x3e\x00\x3c\x00\xc4\x00\x3d\x00\x64\x00\x3e\x00\x3c\x00\x88\x00\x3d\x00\xc5\x00\x3e\x00\xef\x00\x73\x00\x3d\x00\x73\x00\x3e\x00\x5d\x00\xc8\x00\x3d\x00\x89\x00\x3e\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x85\x00\xd5\x00\x78\x00\x8b\x00\x87\x00\x82\x00\x8c\x00\x83\x00\x7e\x00\x76\x00\x1a\x01\x76\x00\xd8\x00\x79\x00\xc9\x00\xd6\x00\x8d\x00\x7a\x00\x7b\x00\x87\x00\xe9\x00\x8e\x00\xde\x00\x73\x00\xda\x00\x7c\x00\x7d\x00\xde\x00\x82\x00\xa9\x00\x78\x00\x85\x00\x73\x00\x78\x00\x4d\x00\xf8\x00\x4d\x00\x3e\x00\x4d\x00\xec\x00\x59\x00\x79\x00\x3e\x00\x73\x00\x79\x00\x7a\x00\x7b\x00\xdb\x00\x7a\x00\x7b\x00\x1b\x01\x76\x00\x78\x00\x7c\x00\x7d\x00\x73\x00\x7c\x00\x7d\x00\x7d\x00\x7e\x00\x76\x00\xea\x00\x4d\x00\x79\x00\xdf\x00\x4d\x00\x32\x00\x7a\x00\x7b\x00\x50\x00\x1d\x01\x76\x00\x4d\x00\x4e\x00\x5e\x00\x7c\x00\x7d\x00\xb6\x00\xb7\x00\xb5\x00\xa1\x00\xa2\x00\x75\x00\x76\x00\x4d\x00\xab\x00\xac\x00\xa3\x00\xce\x00\xb5\x00\xa1\x00\xa2\x00\x56\x00\xbb\x00\xa5\x00\xb0\x00\xac\x00\xa3\x00\xb4\x00\xb5\x00\xa1\x00\xa2\x00\x5a\x00\xaf\x00\xa5\x00\xb0\x00\xac\x00\xa3\x00\xa0\x00\xa1\x00\xa2\x00\xa0\x00\xa1\x00\xa2\x00\xa5\x00\x67\x00\xa3\x00\x2c\x01\x6f\x00\xa3\x00\xa4\x00\x6b\x00\x85\x00\xa5\x00\x90\x00\x94\x00\xa5\x00\x10\x01\xa1\x00\xa2\x00\xb3\x00\xa1\x00\xa2\x00\x96\x00\x9a\x00\xa3\x00\x9e\x00\xa8\x00\xa3\x00\x5c\x00\xaa\x00\x5d\x00\xa5\x00\xad\x00\xb1\x00\xa5\x00\x60\x00\x61\x00\x62\x00\x2a\x01\x63\x00\x64\x00\x60\x00\x61\x00\x62\x00\x2e\x01\x63\x00\x64\x00\x2c\x01\x29\x01\x24\x01\x4c\x00\x16\x01\x26\x01\x4c\x00\xdd\x00\xde\x00\x55\x00\x98\x00\xf6\x00\x1d\x01\xfd\x00\x4d\x00\x69\x00\xfe\x00\x71\x00\x08\x01\xdd\x00\x07\x01\x04\x01\x87\x00\x0c\x01\x98\x00\x0e\x01\x92\x00\x9c\x00\x10\x01\xa0\x00\xaf\x00\x13\x01\xaf\x00\x55\x00\xbe\x00\x55\x00\xff\xff\x9c\x00\xff\xff\xff\xff\x4d\x00\x4c\x00\xff\xff\x4d\x00\x87\x00\xce\x00\x98\x00\xd5\x00\xff\xff\xff\xff\x4d\x00\xc4\x00\xff\xff\xff\xff\x4d\x00\xc8\x00\x55\x00\xff\xff\x92\x00\xff\xff\xff\xff\x6d\x00\x69\x00\xe3\x00\xe5\x00\xe6\x00\xe7\x00\xff\xff\xde\x00\xff\xff\xcd\x00\x50\x00\x34\x00\x50\x00\x69\x00\xff\xff\x6d\x00\x87\x00\x96\x00\xa0\x00\x00\x00\x9c\x00\xa7\x00\x71\x00\xff\xff\xaf\x00\x00\x00\x4d\x00\x98\x00\x00\x00\xff\xff\x00\x00\x00\x00\x00\x00\xff\xff\x4c\x00\xff\xff\x4d\x00\x4c\x00\xff\xff\x4d\x00\x32\x00\xff\xff\xff\xff\xff\xff\x71\x00\x4d\x00\x4c\x00\x55\x00\x4d\x00\x4c\x00\x55\x00\x92\x00\x4c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa8\x00\x00\x00\x00\x00\x00\x00\x4d\x00\x00\x00\x00\x00\x00\x00\x4d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (48, 155) [
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71),
	(72 , happyReduce_72),
	(73 , happyReduce_73),
	(74 , happyReduce_74),
	(75 , happyReduce_75),
	(76 , happyReduce_76),
	(77 , happyReduce_77),
	(78 , happyReduce_78),
	(79 , happyReduce_79),
	(80 , happyReduce_80),
	(81 , happyReduce_81),
	(82 , happyReduce_82),
	(83 , happyReduce_83),
	(84 , happyReduce_84),
	(85 , happyReduce_85),
	(86 , happyReduce_86),
	(87 , happyReduce_87),
	(88 , happyReduce_88),
	(89 , happyReduce_89),
	(90 , happyReduce_90),
	(91 , happyReduce_91),
	(92 , happyReduce_92),
	(93 , happyReduce_93),
	(94 , happyReduce_94),
	(95 , happyReduce_95),
	(96 , happyReduce_96),
	(97 , happyReduce_97),
	(98 , happyReduce_98),
	(99 , happyReduce_99),
	(100 , happyReduce_100),
	(101 , happyReduce_101),
	(102 , happyReduce_102),
	(103 , happyReduce_103),
	(104 , happyReduce_104),
	(105 , happyReduce_105),
	(106 , happyReduce_106),
	(107 , happyReduce_107),
	(108 , happyReduce_108),
	(109 , happyReduce_109),
	(110 , happyReduce_110),
	(111 , happyReduce_111),
	(112 , happyReduce_112),
	(113 , happyReduce_113),
	(114 , happyReduce_114),
	(115 , happyReduce_115),
	(116 , happyReduce_116),
	(117 , happyReduce_117),
	(118 , happyReduce_118),
	(119 , happyReduce_119),
	(120 , happyReduce_120),
	(121 , happyReduce_121),
	(122 , happyReduce_122),
	(123 , happyReduce_123),
	(124 , happyReduce_124),
	(125 , happyReduce_125),
	(126 , happyReduce_126),
	(127 , happyReduce_127),
	(128 , happyReduce_128),
	(129 , happyReduce_129),
	(130 , happyReduce_130),
	(131 , happyReduce_131),
	(132 , happyReduce_132),
	(133 , happyReduce_133),
	(134 , happyReduce_134),
	(135 , happyReduce_135),
	(136 , happyReduce_136),
	(137 , happyReduce_137),
	(138 , happyReduce_138),
	(139 , happyReduce_139),
	(140 , happyReduce_140),
	(141 , happyReduce_141),
	(142 , happyReduce_142),
	(143 , happyReduce_143),
	(144 , happyReduce_144),
	(145 , happyReduce_145),
	(146 , happyReduce_146),
	(147 , happyReduce_147),
	(148 , happyReduce_148),
	(149 , happyReduce_149),
	(150 , happyReduce_150),
	(151 , happyReduce_151),
	(152 , happyReduce_152),
	(153 , happyReduce_153),
	(154 , happyReduce_154),
	(155 , happyReduce_155)
	]

happy_n_terms = 56 :: Int
happy_n_nonterms = 53 :: Int

happyReduce_48 = happySpecReduce_1  0# happyReduction_48
happyReduction_48 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TI happy_var_1)) -> 
	happyIn51
		 ((read ( happy_var_1)) :: Integer
	)}

happyReduce_49 = happySpecReduce_1  1# happyReduction_49
happyReduction_49 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TD happy_var_1)) -> 
	happyIn52
		 ((read ( happy_var_1)) :: Double
	)}

happyReduce_50 = happySpecReduce_1  2# happyReduction_50
happyReduction_50 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TC happy_var_1)) -> 
	happyIn53
		 ((read ( happy_var_1)) :: Char
	)}

happyReduce_51 = happySpecReduce_1  3# happyReduction_51
happyReduction_51 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (T_CID happy_var_1)) -> 
	happyIn54
		 (CID (happy_var_1)
	)}

happyReduce_52 = happySpecReduce_1  4# happyReduction_52
happyReduction_52 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (T_ID happy_var_1)) -> 
	happyIn55
		 (ID (happy_var_1)
	)}

happyReduce_53 = happySpecReduce_1  5# happyReduction_53
happyReduction_53 happy_x_1
	 =  case happyOut57 happy_x_1 of { happy_var_1 -> 
	happyIn56
		 (AbsM.ProgBlock happy_var_1
	)}

happyReduce_54 = happySpecReduce_2  6# happyReduction_54
happyReduction_54 happy_x_2
	happy_x_1
	 =  case happyOut58 happy_x_1 of { happy_var_1 -> 
	case happyOut79 happy_x_2 of { happy_var_2 -> 
	happyIn57
		 (AbsM.Block1 happy_var_1 happy_var_2
	)}}

happyReduce_55 = happySpecReduce_3  7# happyReduction_55
happyReduction_55 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut59 happy_x_1 of { happy_var_1 -> 
	case happyOut58 happy_x_3 of { happy_var_3 -> 
	happyIn58
		 (AbsM.Declarations1 happy_var_1 happy_var_3
	)}}

happyReduce_56 = happySpecReduce_0  7# happyReduction_56
happyReduction_56  =  happyIn58
		 (AbsM.Declarations2
	)

happyReduce_57 = happySpecReduce_1  8# happyReduction_57
happyReduction_57 happy_x_1
	 =  case happyOut60 happy_x_1 of { happy_var_1 -> 
	happyIn59
		 (AbsM.DeclarationVar_declaration happy_var_1
	)}

happyReduce_58 = happySpecReduce_1  8# happyReduction_58
happyReduction_58 happy_x_1
	 =  case happyOut66 happy_x_1 of { happy_var_1 -> 
	happyIn59
		 (AbsM.DeclarationFun_declaration happy_var_1
	)}

happyReduce_59 = happySpecReduce_1  8# happyReduction_59
happyReduction_59 happy_x_1
	 =  case happyOut73 happy_x_1 of { happy_var_1 -> 
	happyIn59
		 (AbsM.DeclarationData_declaration happy_var_1
	)}

happyReduce_60 = happyReduce 4# 9# happyReduction_60
happyReduction_60 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut61 happy_x_2 of { happy_var_2 -> 
	case happyOut65 happy_x_4 of { happy_var_4 -> 
	happyIn60
		 (AbsM.Var_declaration1 happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_61 = happySpecReduce_2  10# happyReduction_61
happyReduction_61 happy_x_2
	happy_x_1
	 =  case happyOut63 happy_x_1 of { happy_var_1 -> 
	case happyOut62 happy_x_2 of { happy_var_2 -> 
	happyIn61
		 (AbsM.Var_specs1 happy_var_1 happy_var_2
	)}}

happyReduce_62 = happySpecReduce_3  11# happyReduction_62
happyReduction_62 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut63 happy_x_2 of { happy_var_2 -> 
	case happyOut62 happy_x_3 of { happy_var_3 -> 
	happyIn62
		 (AbsM.More_var_specs1 happy_var_2 happy_var_3
	)}}

happyReduce_63 = happySpecReduce_0  11# happyReduction_63
happyReduction_63  =  happyIn62
		 (AbsM.More_var_specs2
	)

happyReduce_64 = happySpecReduce_1  12# happyReduction_64
happyReduction_64 happy_x_1
	 =  case happyOut64 happy_x_1 of { happy_var_1 -> 
	happyIn63
		 (AbsM.Var_specArray_dimensions happy_var_1
	)}

happyReduce_65 = happyReduce 4# 13# happyReduction_65
happyReduction_65 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut90 happy_x_2 of { happy_var_2 -> 
	case happyOut64 happy_x_4 of { happy_var_4 -> 
	happyIn64
		 (AbsM.Array_dimensions1 happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_66 = happySpecReduce_0  13# happyReduction_66
happyReduction_66  =  happyIn64
		 (AbsM.Array_dimensions2
	)

happyReduce_67 = happySpecReduce_1  14# happyReduction_67
happyReduction_67 happy_x_1
	 =  happyIn65
		 (AbsM.Type_int
	)

happyReduce_68 = happySpecReduce_1  14# happyReduction_68
happyReduction_68 happy_x_1
	 =  happyIn65
		 (AbsM.Type_real
	)

happyReduce_69 = happySpecReduce_1  14# happyReduction_69
happyReduction_69 happy_x_1
	 =  happyIn65
		 (AbsM.Type_bool
	)

happyReduce_70 = happySpecReduce_1  14# happyReduction_70
happyReduction_70 happy_x_1
	 =  happyIn65
		 (AbsM.Type_char
	)

happyReduce_71 = happySpecReduce_1  14# happyReduction_71
happyReduction_71 happy_x_1
	 =  case happyOut55 happy_x_1 of { happy_var_1 -> 
	happyIn65
		 (AbsM.TypeID happy_var_1
	)}

happyReduce_72 = happyReduce 8# 15# happyReduction_72
happyReduction_72 (happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut55 happy_x_2 of { happy_var_2 -> 
	case happyOut68 happy_x_3 of { happy_var_3 -> 
	case happyOut65 happy_x_5 of { happy_var_5 -> 
	case happyOut67 happy_x_7 of { happy_var_7 -> 
	happyIn66
		 (AbsM.Fun_declaration1 happy_var_2 happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest}}}}

happyReduce_73 = happySpecReduce_2  16# happyReduction_73
happyReduction_73 happy_x_2
	happy_x_1
	 =  case happyOut58 happy_x_1 of { happy_var_1 -> 
	case happyOut80 happy_x_2 of { happy_var_2 -> 
	happyIn67
		 (AbsM.Fun_block1 happy_var_1 happy_var_2
	)}}

happyReduce_74 = happySpecReduce_3  17# happyReduction_74
happyReduction_74 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut69 happy_x_2 of { happy_var_2 -> 
	happyIn68
		 (AbsM.Param_list1 happy_var_2
	)}

happyReduce_75 = happySpecReduce_2  18# happyReduction_75
happyReduction_75 happy_x_2
	happy_x_1
	 =  case happyOut71 happy_x_1 of { happy_var_1 -> 
	case happyOut70 happy_x_2 of { happy_var_2 -> 
	happyIn69
		 (AbsM.Parameters1 happy_var_1 happy_var_2
	)}}

happyReduce_76 = happySpecReduce_0  18# happyReduction_76
happyReduction_76  =  happyIn69
		 (AbsM.Parameters2
	)

happyReduce_77 = happySpecReduce_3  19# happyReduction_77
happyReduction_77 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut71 happy_x_2 of { happy_var_2 -> 
	case happyOut70 happy_x_3 of { happy_var_3 -> 
	happyIn70
		 (AbsM.More_parameters1 happy_var_2 happy_var_3
	)}}

happyReduce_78 = happySpecReduce_0  19# happyReduction_78
happyReduction_78  =  happyIn70
		 (AbsM.More_parameters2
	)

happyReduce_79 = happyReduce 4# 20# happyReduction_79
happyReduction_79 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut55 happy_x_1 of { happy_var_1 -> 
	case happyOut72 happy_x_2 of { happy_var_2 -> 
	case happyOut65 happy_x_4 of { happy_var_4 -> 
	happyIn71
		 (AbsM.Basic_declaration1 happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest}}}

happyReduce_80 = happySpecReduce_3  21# happyReduction_80
happyReduction_80 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut72 happy_x_3 of { happy_var_3 -> 
	happyIn72
		 (AbsM.Basic_array_dimensions1 happy_var_3
	)}

happyReduce_81 = happySpecReduce_0  21# happyReduction_81
happyReduction_81  =  happyIn72
		 (AbsM.Basic_array_dimensions2
	)

happyReduce_82 = happyReduce 4# 22# happyReduction_82
happyReduction_82 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut55 happy_x_2 of { happy_var_2 -> 
	case happyOut74 happy_x_4 of { happy_var_4 -> 
	happyIn73
		 (AbsM.Data_declaration1 happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_83 = happySpecReduce_2  23# happyReduction_83
happyReduction_83 happy_x_2
	happy_x_1
	 =  case happyOut76 happy_x_1 of { happy_var_1 -> 
	case happyOut75 happy_x_2 of { happy_var_2 -> 
	happyIn74
		 (AbsM.Cons_declarations1 happy_var_1 happy_var_2
	)}}

happyReduce_84 = happySpecReduce_3  24# happyReduction_84
happyReduction_84 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut76 happy_x_2 of { happy_var_2 -> 
	case happyOut75 happy_x_3 of { happy_var_3 -> 
	happyIn75
		 (AbsM.More_cons_decl1 happy_var_2 happy_var_3
	)}}

happyReduce_85 = happySpecReduce_0  24# happyReduction_85
happyReduction_85  =  happyIn75
		 (AbsM.More_cons_decl2
	)

happyReduce_86 = happySpecReduce_3  25# happyReduction_86
happyReduction_86 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut54 happy_x_1 of { happy_var_1 -> 
	case happyOut77 happy_x_3 of { happy_var_3 -> 
	happyIn76
		 (AbsM.Cons_decl1 happy_var_1 happy_var_3
	)}}

happyReduce_87 = happySpecReduce_1  25# happyReduction_87
happyReduction_87 happy_x_1
	 =  case happyOut54 happy_x_1 of { happy_var_1 -> 
	happyIn76
		 (AbsM.Cons_declCID happy_var_1
	)}

happyReduce_88 = happySpecReduce_2  26# happyReduction_88
happyReduction_88 happy_x_2
	happy_x_1
	 =  case happyOut65 happy_x_1 of { happy_var_1 -> 
	case happyOut78 happy_x_2 of { happy_var_2 -> 
	happyIn77
		 (AbsM.Type_list1 happy_var_1 happy_var_2
	)}}

happyReduce_89 = happySpecReduce_3  27# happyReduction_89
happyReduction_89 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut65 happy_x_2 of { happy_var_2 -> 
	case happyOut78 happy_x_3 of { happy_var_3 -> 
	happyIn78
		 (AbsM.More_type1 happy_var_2 happy_var_3
	)}}

happyReduce_90 = happySpecReduce_0  27# happyReduction_90
happyReduction_90  =  happyIn78
		 (AbsM.More_type2
	)

happyReduce_91 = happySpecReduce_3  28# happyReduction_91
happyReduction_91 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut81 happy_x_2 of { happy_var_2 -> 
	happyIn79
		 (AbsM.Program_body1 happy_var_2
	)}

happyReduce_92 = happySpecReduce_1  28# happyReduction_92
happyReduction_92 happy_x_1
	 =  case happyOut81 happy_x_1 of { happy_var_1 -> 
	happyIn79
		 (AbsM.Program_bodyProg_stmts happy_var_1
	)}

happyReduce_93 = happyReduce 6# 29# happyReduction_93
happyReduction_93 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut81 happy_x_2 of { happy_var_2 -> 
	case happyOut90 happy_x_4 of { happy_var_4 -> 
	happyIn80
		 (AbsM.Fun_body1 happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_94 = happyReduce 4# 29# happyReduction_94
happyReduction_94 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut81 happy_x_1 of { happy_var_1 -> 
	case happyOut90 happy_x_3 of { happy_var_3 -> 
	happyIn80
		 (AbsM.Fun_body2 happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_95 = happySpecReduce_3  30# happyReduction_95
happyReduction_95 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut82 happy_x_1 of { happy_var_1 -> 
	case happyOut81 happy_x_3 of { happy_var_3 -> 
	happyIn81
		 (AbsM.Prog_stmts1 happy_var_1 happy_var_3
	)}}

happyReduce_96 = happySpecReduce_0  30# happyReduction_96
happyReduction_96  =  happyIn81
		 (AbsM.Prog_stmts2
	)

happyReduce_97 = happyReduce 6# 31# happyReduction_97
happyReduction_97 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut90 happy_x_2 of { happy_var_2 -> 
	case happyOut82 happy_x_4 of { happy_var_4 -> 
	case happyOut82 happy_x_6 of { happy_var_6 -> 
	happyIn82
		 (AbsM.Prog_stmt1 happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_98 = happyReduce 4# 31# happyReduction_98
happyReduction_98 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut90 happy_x_2 of { happy_var_2 -> 
	case happyOut82 happy_x_4 of { happy_var_4 -> 
	happyIn82
		 (AbsM.Prog_stmt2 happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_99 = happySpecReduce_2  31# happyReduction_99
happyReduction_99 happy_x_2
	happy_x_1
	 =  case happyOut83 happy_x_2 of { happy_var_2 -> 
	happyIn82
		 (AbsM.Prog_stmt3 happy_var_2
	)}

happyReduce_100 = happySpecReduce_3  31# happyReduction_100
happyReduction_100 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut83 happy_x_1 of { happy_var_1 -> 
	case happyOut90 happy_x_3 of { happy_var_3 -> 
	happyIn82
		 (AbsM.Prog_stmt4 happy_var_1 happy_var_3
	)}}

happyReduce_101 = happySpecReduce_2  31# happyReduction_101
happyReduction_101 happy_x_2
	happy_x_1
	 =  case happyOut90 happy_x_2 of { happy_var_2 -> 
	happyIn82
		 (AbsM.Prog_stmt5 happy_var_2
	)}

happyReduce_102 = happySpecReduce_3  31# happyReduction_102
happyReduction_102 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut57 happy_x_2 of { happy_var_2 -> 
	happyIn82
		 (AbsM.Prog_stmt6 happy_var_2
	)}

happyReduce_103 = happyReduce 6# 31# happyReduction_103
happyReduction_103 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut90 happy_x_2 of { happy_var_2 -> 
	case happyOut84 happy_x_5 of { happy_var_5 -> 
	happyIn82
		 (AbsM.Prog_stmt7 happy_var_2 happy_var_5
	) `HappyStk` happyRest}}

happyReduce_104 = happySpecReduce_2  32# happyReduction_104
happyReduction_104 happy_x_2
	happy_x_1
	 =  case happyOut55 happy_x_1 of { happy_var_1 -> 
	case happyOut64 happy_x_2 of { happy_var_2 -> 
	happyIn83
		 (AbsM.Location1 happy_var_1 happy_var_2
	)}}

happyReduce_105 = happySpecReduce_2  33# happyReduction_105
happyReduction_105 happy_x_2
	happy_x_1
	 =  case happyOut86 happy_x_1 of { happy_var_1 -> 
	case happyOut85 happy_x_2 of { happy_var_2 -> 
	happyIn84
		 (AbsM.Case_list1 happy_var_1 happy_var_2
	)}}

happyReduce_106 = happySpecReduce_3  34# happyReduction_106
happyReduction_106 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut86 happy_x_2 of { happy_var_2 -> 
	case happyOut85 happy_x_3 of { happy_var_3 -> 
	happyIn85
		 (AbsM.More_case1 happy_var_2 happy_var_3
	)}}

happyReduce_107 = happySpecReduce_0  34# happyReduction_107
happyReduction_107  =  happyIn85
		 (AbsM.More_case2
	)

happyReduce_108 = happyReduce 4# 35# happyReduction_108
happyReduction_108 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut54 happy_x_1 of { happy_var_1 -> 
	case happyOut87 happy_x_2 of { happy_var_2 -> 
	case happyOut82 happy_x_4 of { happy_var_4 -> 
	happyIn86
		 (AbsM.Case1 happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest}}}

happyReduce_109 = happySpecReduce_3  36# happyReduction_109
happyReduction_109 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut88 happy_x_2 of { happy_var_2 -> 
	happyIn87
		 (AbsM.Var_list1 happy_var_2
	)}

happyReduce_110 = happySpecReduce_0  36# happyReduction_110
happyReduction_110  =  happyIn87
		 (AbsM.Var_list2
	)

happyReduce_111 = happySpecReduce_2  37# happyReduction_111
happyReduction_111 happy_x_2
	happy_x_1
	 =  case happyOut55 happy_x_1 of { happy_var_1 -> 
	case happyOut89 happy_x_2 of { happy_var_2 -> 
	happyIn88
		 (AbsM.Var_list11 happy_var_1 happy_var_2
	)}}

happyReduce_112 = happySpecReduce_3  38# happyReduction_112
happyReduction_112 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut55 happy_x_2 of { happy_var_2 -> 
	case happyOut89 happy_x_3 of { happy_var_3 -> 
	happyIn89
		 (AbsM.More_var_list1 happy_var_2 happy_var_3
	)}}

happyReduce_113 = happySpecReduce_0  38# happyReduction_113
happyReduction_113  =  happyIn89
		 (AbsM.More_var_list2
	)

happyReduce_114 = happySpecReduce_3  39# happyReduction_114
happyReduction_114 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut90 happy_x_1 of { happy_var_1 -> 
	case happyOut91 happy_x_3 of { happy_var_3 -> 
	happyIn90
		 (AbsM.Expr1 happy_var_1 happy_var_3
	)}}

happyReduce_115 = happySpecReduce_1  39# happyReduction_115
happyReduction_115 happy_x_1
	 =  case happyOut91 happy_x_1 of { happy_var_1 -> 
	happyIn90
		 (AbsM.ExprBint_term happy_var_1
	)}

happyReduce_116 = happySpecReduce_3  40# happyReduction_116
happyReduction_116 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut91 happy_x_1 of { happy_var_1 -> 
	case happyOut92 happy_x_3 of { happy_var_3 -> 
	happyIn91
		 (AbsM.Bint_term1 happy_var_1 happy_var_3
	)}}

happyReduce_117 = happySpecReduce_1  40# happyReduction_117
happyReduction_117 happy_x_1
	 =  case happyOut92 happy_x_1 of { happy_var_1 -> 
	happyIn91
		 (AbsM.Bint_termBint_factor happy_var_1
	)}

happyReduce_118 = happySpecReduce_2  41# happyReduction_118
happyReduction_118 happy_x_2
	happy_x_1
	 =  case happyOut92 happy_x_2 of { happy_var_2 -> 
	happyIn92
		 (AbsM.Bint_factor1 happy_var_2
	)}

happyReduce_119 = happySpecReduce_3  41# happyReduction_119
happyReduction_119 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut94 happy_x_1 of { happy_var_1 -> 
	case happyOut93 happy_x_2 of { happy_var_2 -> 
	case happyOut94 happy_x_3 of { happy_var_3 -> 
	happyIn92
		 (AbsM.Bint_factor2 happy_var_1 happy_var_2 happy_var_3
	)}}}

happyReduce_120 = happySpecReduce_1  41# happyReduction_120
happyReduction_120 happy_x_1
	 =  case happyOut94 happy_x_1 of { happy_var_1 -> 
	happyIn92
		 (AbsM.Bint_factorInt_expr happy_var_1
	)}

happyReduce_121 = happySpecReduce_1  42# happyReduction_121
happyReduction_121 happy_x_1
	 =  happyIn93
		 (AbsM.Compare_op1
	)

happyReduce_122 = happySpecReduce_1  42# happyReduction_122
happyReduction_122 happy_x_1
	 =  happyIn93
		 (AbsM.Compare_op2
	)

happyReduce_123 = happySpecReduce_1  42# happyReduction_123
happyReduction_123 happy_x_1
	 =  happyIn93
		 (AbsM.Compare_op3
	)

happyReduce_124 = happySpecReduce_1  42# happyReduction_124
happyReduction_124 happy_x_1
	 =  happyIn93
		 (AbsM.Compare_op4
	)

happyReduce_125 = happySpecReduce_1  42# happyReduction_125
happyReduction_125 happy_x_1
	 =  happyIn93
		 (AbsM.Compare_op5
	)

happyReduce_126 = happySpecReduce_3  43# happyReduction_126
happyReduction_126 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut94 happy_x_1 of { happy_var_1 -> 
	case happyOut95 happy_x_2 of { happy_var_2 -> 
	case happyOut96 happy_x_3 of { happy_var_3 -> 
	happyIn94
		 (AbsM.Int_expr1 happy_var_1 happy_var_2 happy_var_3
	)}}}

happyReduce_127 = happySpecReduce_1  43# happyReduction_127
happyReduction_127 happy_x_1
	 =  case happyOut96 happy_x_1 of { happy_var_1 -> 
	happyIn94
		 (AbsM.Int_exprInt_term happy_var_1
	)}

happyReduce_128 = happySpecReduce_1  44# happyReduction_128
happyReduction_128 happy_x_1
	 =  happyIn95
		 (AbsM.Addop1
	)

happyReduce_129 = happySpecReduce_1  44# happyReduction_129
happyReduction_129 happy_x_1
	 =  happyIn95
		 (AbsM.Addop2
	)

happyReduce_130 = happySpecReduce_3  45# happyReduction_130
happyReduction_130 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut96 happy_x_1 of { happy_var_1 -> 
	case happyOut97 happy_x_2 of { happy_var_2 -> 
	case happyOut98 happy_x_3 of { happy_var_3 -> 
	happyIn96
		 (AbsM.Int_term1 happy_var_1 happy_var_2 happy_var_3
	)}}}

happyReduce_131 = happySpecReduce_1  45# happyReduction_131
happyReduction_131 happy_x_1
	 =  case happyOut98 happy_x_1 of { happy_var_1 -> 
	happyIn96
		 (AbsM.Int_termInt_factor happy_var_1
	)}

happyReduce_132 = happySpecReduce_1  46# happyReduction_132
happyReduction_132 happy_x_1
	 =  happyIn97
		 (AbsM.Mulop1
	)

happyReduce_133 = happySpecReduce_1  46# happyReduction_133
happyReduction_133 happy_x_1
	 =  happyIn97
		 (AbsM.Mulop2
	)

happyReduce_134 = happySpecReduce_3  47# happyReduction_134
happyReduction_134 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut90 happy_x_2 of { happy_var_2 -> 
	happyIn98
		 (AbsM.Int_factor1 happy_var_2
	)}

happyReduce_135 = happyReduce 5# 47# happyReduction_135
happyReduction_135 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut55 happy_x_3 of { happy_var_3 -> 
	case happyOut72 happy_x_4 of { happy_var_4 -> 
	happyIn98
		 (AbsM.Int_factor2 happy_var_3 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_136 = happyReduce 4# 47# happyReduction_136
happyReduction_136 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut90 happy_x_3 of { happy_var_3 -> 
	happyIn98
		 (AbsM.Int_factor3 happy_var_3
	) `HappyStk` happyRest}

happyReduce_137 = happyReduce 4# 47# happyReduction_137
happyReduction_137 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut90 happy_x_3 of { happy_var_3 -> 
	happyIn98
		 (AbsM.Int_factor4 happy_var_3
	) `HappyStk` happyRest}

happyReduce_138 = happyReduce 4# 47# happyReduction_138
happyReduction_138 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut90 happy_x_3 of { happy_var_3 -> 
	happyIn98
		 (AbsM.Int_factor5 happy_var_3
	) `HappyStk` happyRest}

happyReduce_139 = happySpecReduce_2  47# happyReduction_139
happyReduction_139 happy_x_2
	happy_x_1
	 =  case happyOut55 happy_x_1 of { happy_var_1 -> 
	case happyOut99 happy_x_2 of { happy_var_2 -> 
	happyIn98
		 (AbsM.Int_factor6 happy_var_1 happy_var_2
	)}}

happyReduce_140 = happySpecReduce_2  47# happyReduction_140
happyReduction_140 happy_x_2
	happy_x_1
	 =  case happyOut54 happy_x_1 of { happy_var_1 -> 
	case happyOut101 happy_x_2 of { happy_var_2 -> 
	happyIn98
		 (AbsM.Int_factor7 happy_var_1 happy_var_2
	)}}

happyReduce_141 = happySpecReduce_1  47# happyReduction_141
happyReduction_141 happy_x_1
	 =  case happyOut51 happy_x_1 of { happy_var_1 -> 
	happyIn98
		 (AbsM.Int_factorInteger happy_var_1
	)}

happyReduce_142 = happySpecReduce_1  47# happyReduction_142
happyReduction_142 happy_x_1
	 =  case happyOut52 happy_x_1 of { happy_var_1 -> 
	happyIn98
		 (AbsM.Int_factorDouble happy_var_1
	)}

happyReduce_143 = happySpecReduce_1  47# happyReduction_143
happyReduction_143 happy_x_1
	 =  happyIn98
		 (AbsM.Int_factor_true
	)

happyReduce_144 = happySpecReduce_1  47# happyReduction_144
happyReduction_144 happy_x_1
	 =  happyIn98
		 (AbsM.Int_factor_false
	)

happyReduce_145 = happySpecReduce_1  47# happyReduction_145
happyReduction_145 happy_x_1
	 =  case happyOut53 happy_x_1 of { happy_var_1 -> 
	happyIn98
		 (AbsM.Int_factorChar happy_var_1
	)}

happyReduce_146 = happySpecReduce_2  47# happyReduction_146
happyReduction_146 happy_x_2
	happy_x_1
	 =  case happyOut98 happy_x_2 of { happy_var_2 -> 
	happyIn98
		 (AbsM.Int_factor8 happy_var_2
	)}

happyReduce_147 = happySpecReduce_1  48# happyReduction_147
happyReduction_147 happy_x_1
	 =  case happyOut100 happy_x_1 of { happy_var_1 -> 
	happyIn99
		 (AbsM.Modifier_listFun_argument_list happy_var_1
	)}

happyReduce_148 = happySpecReduce_1  48# happyReduction_148
happyReduction_148 happy_x_1
	 =  case happyOut64 happy_x_1 of { happy_var_1 -> 
	happyIn99
		 (AbsM.Modifier_listArray_dimensions happy_var_1
	)}

happyReduce_149 = happySpecReduce_3  49# happyReduction_149
happyReduction_149 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut102 happy_x_2 of { happy_var_2 -> 
	happyIn100
		 (AbsM.Fun_argument_list1 happy_var_2
	)}

happyReduce_150 = happySpecReduce_1  50# happyReduction_150
happyReduction_150 happy_x_1
	 =  case happyOut100 happy_x_1 of { happy_var_1 -> 
	happyIn101
		 (AbsM.Cons_argument_listFun_argument_list happy_var_1
	)}

happyReduce_151 = happySpecReduce_0  50# happyReduction_151
happyReduction_151  =  happyIn101
		 (AbsM.Cons_argument_list1
	)

happyReduce_152 = happySpecReduce_2  51# happyReduction_152
happyReduction_152 happy_x_2
	happy_x_1
	 =  case happyOut90 happy_x_1 of { happy_var_1 -> 
	case happyOut103 happy_x_2 of { happy_var_2 -> 
	happyIn102
		 (AbsM.Arguments1 happy_var_1 happy_var_2
	)}}

happyReduce_153 = happySpecReduce_0  51# happyReduction_153
happyReduction_153  =  happyIn102
		 (AbsM.Arguments2
	)

happyReduce_154 = happySpecReduce_3  52# happyReduction_154
happyReduction_154 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut90 happy_x_2 of { happy_var_2 -> 
	case happyOut103 happy_x_3 of { happy_var_3 -> 
	happyIn103
		 (AbsM.More_arguments1 happy_var_2 happy_var_3
	)}}

happyReduce_155 = happySpecReduce_0  52# happyReduction_155
happyReduction_155  =  happyIn103
		 (AbsM.More_arguments2
	)

happyNewToken action sts stk [] =
	happyDoAction 55# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 1#;
	PT _ (TS _ 2) -> cont 2#;
	PT _ (TS _ 3) -> cont 3#;
	PT _ (TS _ 4) -> cont 4#;
	PT _ (TS _ 5) -> cont 5#;
	PT _ (TS _ 6) -> cont 6#;
	PT _ (TS _ 7) -> cont 7#;
	PT _ (TS _ 8) -> cont 8#;
	PT _ (TS _ 9) -> cont 9#;
	PT _ (TS _ 10) -> cont 10#;
	PT _ (TS _ 11) -> cont 11#;
	PT _ (TS _ 12) -> cont 12#;
	PT _ (TS _ 13) -> cont 13#;
	PT _ (TS _ 14) -> cont 14#;
	PT _ (TS _ 15) -> cont 15#;
	PT _ (TS _ 16) -> cont 16#;
	PT _ (TS _ 17) -> cont 17#;
	PT _ (TS _ 18) -> cont 18#;
	PT _ (TS _ 19) -> cont 19#;
	PT _ (TS _ 20) -> cont 20#;
	PT _ (TS _ 21) -> cont 21#;
	PT _ (TS _ 22) -> cont 22#;
	PT _ (TS _ 23) -> cont 23#;
	PT _ (TS _ 24) -> cont 24#;
	PT _ (TS _ 25) -> cont 25#;
	PT _ (TS _ 26) -> cont 26#;
	PT _ (TS _ 27) -> cont 27#;
	PT _ (TS _ 28) -> cont 28#;
	PT _ (TS _ 29) -> cont 29#;
	PT _ (TS _ 30) -> cont 30#;
	PT _ (TS _ 31) -> cont 31#;
	PT _ (TS _ 32) -> cont 32#;
	PT _ (TS _ 33) -> cont 33#;
	PT _ (TS _ 34) -> cont 34#;
	PT _ (TS _ 35) -> cont 35#;
	PT _ (TS _ 36) -> cont 36#;
	PT _ (TS _ 37) -> cont 37#;
	PT _ (TS _ 38) -> cont 38#;
	PT _ (TS _ 39) -> cont 39#;
	PT _ (TS _ 40) -> cont 40#;
	PT _ (TS _ 41) -> cont 41#;
	PT _ (TS _ 42) -> cont 42#;
	PT _ (TS _ 43) -> cont 43#;
	PT _ (TS _ 44) -> cont 44#;
	PT _ (TS _ 45) -> cont 45#;
	PT _ (TS _ 46) -> cont 46#;
	PT _ (TS _ 47) -> cont 47#;
	PT _ (TS _ 48) -> cont 48#;
	PT _ (TS _ 49) -> cont 49#;
	PT _ (TI happy_dollar_dollar) -> cont 50#;
	PT _ (TD happy_dollar_dollar) -> cont 51#;
	PT _ (TC happy_dollar_dollar) -> cont 52#;
	PT _ (T_CID happy_dollar_dollar) -> cont 53#;
	PT _ (T_ID happy_dollar_dollar) -> cont 54#;
	_ -> happyError' (tk:tks)
	}

happyError_ 55# tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = (thenM)
happyReturn :: () => a -> Err a
happyReturn = (returnM)
happyThen1 m k tks = (thenM) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (returnM) a
happyError' :: () => [(Token)] -> Err a
happyError' = happyError

pProg tks = happySomeParser where
  happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (happyOut56 x))

pBlock tks = happySomeParser where
  happySomeParser = happyThen (happyParse 1# tks) (\x -> happyReturn (happyOut57 x))

pDeclarations tks = happySomeParser where
  happySomeParser = happyThen (happyParse 2# tks) (\x -> happyReturn (happyOut58 x))

pDeclaration tks = happySomeParser where
  happySomeParser = happyThen (happyParse 3# tks) (\x -> happyReturn (happyOut59 x))

pVar_declaration tks = happySomeParser where
  happySomeParser = happyThen (happyParse 4# tks) (\x -> happyReturn (happyOut60 x))

pVar_specs tks = happySomeParser where
  happySomeParser = happyThen (happyParse 5# tks) (\x -> happyReturn (happyOut61 x))

pMore_var_specs tks = happySomeParser where
  happySomeParser = happyThen (happyParse 6# tks) (\x -> happyReturn (happyOut62 x))

pVar_spec tks = happySomeParser where
  happySomeParser = happyThen (happyParse 7# tks) (\x -> happyReturn (happyOut63 x))

pArray_dimensions tks = happySomeParser where
  happySomeParser = happyThen (happyParse 8# tks) (\x -> happyReturn (happyOut64 x))

pType tks = happySomeParser where
  happySomeParser = happyThen (happyParse 9# tks) (\x -> happyReturn (happyOut65 x))

pFun_declaration tks = happySomeParser where
  happySomeParser = happyThen (happyParse 10# tks) (\x -> happyReturn (happyOut66 x))

pFun_block tks = happySomeParser where
  happySomeParser = happyThen (happyParse 11# tks) (\x -> happyReturn (happyOut67 x))

pParam_list tks = happySomeParser where
  happySomeParser = happyThen (happyParse 12# tks) (\x -> happyReturn (happyOut68 x))

pParameters tks = happySomeParser where
  happySomeParser = happyThen (happyParse 13# tks) (\x -> happyReturn (happyOut69 x))

pMore_parameters tks = happySomeParser where
  happySomeParser = happyThen (happyParse 14# tks) (\x -> happyReturn (happyOut70 x))

pBasic_declaration tks = happySomeParser where
  happySomeParser = happyThen (happyParse 15# tks) (\x -> happyReturn (happyOut71 x))

pBasic_array_dimensions tks = happySomeParser where
  happySomeParser = happyThen (happyParse 16# tks) (\x -> happyReturn (happyOut72 x))

pData_declaration tks = happySomeParser where
  happySomeParser = happyThen (happyParse 17# tks) (\x -> happyReturn (happyOut73 x))

pCons_declarations tks = happySomeParser where
  happySomeParser = happyThen (happyParse 18# tks) (\x -> happyReturn (happyOut74 x))

pMore_cons_decl tks = happySomeParser where
  happySomeParser = happyThen (happyParse 19# tks) (\x -> happyReturn (happyOut75 x))

pCons_decl tks = happySomeParser where
  happySomeParser = happyThen (happyParse 20# tks) (\x -> happyReturn (happyOut76 x))

pType_list tks = happySomeParser where
  happySomeParser = happyThen (happyParse 21# tks) (\x -> happyReturn (happyOut77 x))

pMore_type tks = happySomeParser where
  happySomeParser = happyThen (happyParse 22# tks) (\x -> happyReturn (happyOut78 x))

pProgram_body tks = happySomeParser where
  happySomeParser = happyThen (happyParse 23# tks) (\x -> happyReturn (happyOut79 x))

pFun_body tks = happySomeParser where
  happySomeParser = happyThen (happyParse 24# tks) (\x -> happyReturn (happyOut80 x))

pProg_stmts tks = happySomeParser where
  happySomeParser = happyThen (happyParse 25# tks) (\x -> happyReturn (happyOut81 x))

pProg_stmt tks = happySomeParser where
  happySomeParser = happyThen (happyParse 26# tks) (\x -> happyReturn (happyOut82 x))

pLocation tks = happySomeParser where
  happySomeParser = happyThen (happyParse 27# tks) (\x -> happyReturn (happyOut83 x))

pCase_list tks = happySomeParser where
  happySomeParser = happyThen (happyParse 28# tks) (\x -> happyReturn (happyOut84 x))

pMore_case tks = happySomeParser where
  happySomeParser = happyThen (happyParse 29# tks) (\x -> happyReturn (happyOut85 x))

pCase tks = happySomeParser where
  happySomeParser = happyThen (happyParse 30# tks) (\x -> happyReturn (happyOut86 x))

pVar_list tks = happySomeParser where
  happySomeParser = happyThen (happyParse 31# tks) (\x -> happyReturn (happyOut87 x))

pVar_list1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse 32# tks) (\x -> happyReturn (happyOut88 x))

pMore_var_list tks = happySomeParser where
  happySomeParser = happyThen (happyParse 33# tks) (\x -> happyReturn (happyOut89 x))

pExpr tks = happySomeParser where
  happySomeParser = happyThen (happyParse 34# tks) (\x -> happyReturn (happyOut90 x))

pBint_term tks = happySomeParser where
  happySomeParser = happyThen (happyParse 35# tks) (\x -> happyReturn (happyOut91 x))

pBint_factor tks = happySomeParser where
  happySomeParser = happyThen (happyParse 36# tks) (\x -> happyReturn (happyOut92 x))

pCompare_op tks = happySomeParser where
  happySomeParser = happyThen (happyParse 37# tks) (\x -> happyReturn (happyOut93 x))

pInt_expr tks = happySomeParser where
  happySomeParser = happyThen (happyParse 38# tks) (\x -> happyReturn (happyOut94 x))

pAddop tks = happySomeParser where
  happySomeParser = happyThen (happyParse 39# tks) (\x -> happyReturn (happyOut95 x))

pInt_term tks = happySomeParser where
  happySomeParser = happyThen (happyParse 40# tks) (\x -> happyReturn (happyOut96 x))

pMulop tks = happySomeParser where
  happySomeParser = happyThen (happyParse 41# tks) (\x -> happyReturn (happyOut97 x))

pInt_factor tks = happySomeParser where
  happySomeParser = happyThen (happyParse 42# tks) (\x -> happyReturn (happyOut98 x))

pModifier_list tks = happySomeParser where
  happySomeParser = happyThen (happyParse 43# tks) (\x -> happyReturn (happyOut99 x))

pFun_argument_list tks = happySomeParser where
  happySomeParser = happyThen (happyParse 44# tks) (\x -> happyReturn (happyOut100 x))

pCons_argument_list tks = happySomeParser where
  happySomeParser = happyThen (happyParse 45# tks) (\x -> happyReturn (happyOut101 x))

pArguments tks = happySomeParser where
  happySomeParser = happyThen (happyParse 46# tks) (\x -> happyReturn (happyOut102 x))

pMore_arguments tks = happySomeParser where
  happySomeParser = happyThen (happyParse 47# tks) (\x -> happyReturn (happyOut103 x))

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 11 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































{-# LINE 11 "<command-line>" #-}
{-# LINE 1 "/usr/lib64/ghc-7.10.3/include/ghcversion.h" #-}

















{-# LINE 11 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates/GenericTemplate.hs" #-}





-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif
{-# LINE 46 "templates/GenericTemplate.hs" #-}


data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList





{-# LINE 67 "templates/GenericTemplate.hs" #-}

{-# LINE 77 "templates/GenericTemplate.hs" #-}

{-# LINE 86 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 0#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}


          case action of
                0#           -> {- nothing -}
                                     happyFail i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}

                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}


                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = indexShortOffAddr happyActOffsets st
         off_i  = (off Happy_GHC_Exts.+# i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st


indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#





data HappyAddr = HappyA# Happy_GHC_Exts.Addr#




-----------------------------------------------------------------------------
-- HappyState data type (not arrays)

{-# LINE 170 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = indexShortOffAddr happyGotoOffsets st1
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i



          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = indexShortOffAddr happyGotoOffsets st
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (0# is the error token)

-- parse error if we are in recovery and we fail again
happyFail 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  0# tk old_st (HappyCons ((action)) (sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        happyDoAction 0# tk action sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ( (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
