%{
/*
 *		line numbering	
 */
%}

%%

^.*\n        printf("%d\t%s", yylineno-1, yytext);
