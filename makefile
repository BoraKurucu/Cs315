sup.exe: sup.tab.c lex.yy.c
	gcc -o sup sup.tab.c
sup.tab.c: sup.y lex.yy.c
	bison -v sup.y
lex.yy.c: lexer.l
	flex lexer.l
clean:
	rm -f lex.yy.c y.tab.c sup