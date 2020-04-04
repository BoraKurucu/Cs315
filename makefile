sup: y.tab.c lex.yy.c
	gcc -o sup y.tab.c
y.tab.c: sup.y lex.yy.c
	yacc sup.y
lex.yy.c: lexer.l
	lex lexer.l
clean:
	rm -f lex.yy.c y.tab.c sup