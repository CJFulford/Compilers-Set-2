all:
	happy -gca ParExpr.y
	alex -g LexExpr.x
	ghc --make TestExpr.hs -o TestExpr

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocExpr.* LexExpr.* ParExpr.* LayoutExpr.* SkelExpr.* PrintExpr.* TestExpr.* AbsExpr.* TestExpr ErrM.* SharedString.* ComposOp.* Expr.dtd XMLExpr.* Makefile*
	

