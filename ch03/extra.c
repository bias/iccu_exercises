#include <stdio.h>

main() {
	yyparse();
}

yyerror(char *s) {
	fputs(s, stderr), putc('\n', stderr);
}
