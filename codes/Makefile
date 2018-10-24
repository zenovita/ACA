aca: y.tab.c lex.yy.c
	gcc -o parser y.tab.c
y.tab.c: cs315s18_group07.yacc lex.yy.c
	yacc cs315s18_group07.yacc
lex.yy.c: cs315s18_group07.lex
	lex cs315s18_group07.lex
clean:
	rm -f lex.yy.c y.tab.c aca