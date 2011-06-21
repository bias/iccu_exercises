#include <stdio.h>

main() {
	yyparse();
}

yyerror(s) char *s; {
	fputs(s, stderr), putc('\n', stderr);
}
