calc: lex.yy.c y.tab.c
	clang lex.yy.c y.tab.c -o calc

lex.yy.c: calc.l y.tab.h
	lex calc.l

y.tab.c y.tab.h: calc.y
	yacc -d calc.y

clean:
	rm -f calc lex.yy.c y.tab.c y.tab.h
