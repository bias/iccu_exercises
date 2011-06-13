%{
/*
 *		line numbering	
 */
%}

%%

\n          ECHO;
^.*$        printf("%d\t%s", yylineno, yytext);
