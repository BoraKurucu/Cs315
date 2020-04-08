sup: y.tab.c lex.yy.c
	gcc -o parser y.tab.c
y.tab.c: CS315s20_group16.yacc lex.yy.c
	yacc CS315s20_group16.yacc
lex.yy.c: CS315s20_group16.lex
	lex CS315s20_group16.lex
clean:
	rm -f lex.yy.c y.tab.c sup