%{

/*
 *		word count	
 */

int nchar, nword, nline;

%}

%%

\n			++nchar, ++nline;
[^ \t\n]+	++nword, nchar += yyleng;
.			++nchar;

%%

main() {
	yylex();
	printf("%d\t%d\t%d\n", nchar, nword, nline);
}
