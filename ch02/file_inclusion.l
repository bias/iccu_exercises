%{

/*
 *		.so filename	file inclusion	
 */

#include <ctype.h>
#include <stdio.h>

static include();

%}

%%

^".so".*\n	{ yytext[yyleng-1] = '\0'; include(yytext+3); }

%%

static include(s) char *s; {
	FILE *fp;
	int i;

	while (*s && isspace(*s))
		++s;
	if (fp = fopen(s, "r")) {
		while ((i = getc(fp)) != EOF)
			output(i);
		fclose(fp);
	} 
	else
		perror(s);
}
