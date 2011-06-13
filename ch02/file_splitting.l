%{

/*
 *		.di filename	file splitting	
 */

#include <ctype.h>
#include <stdio.h>

static divert();

%}

%%

^".di".*\n	{ yytext[yyleng-1] = '\0'; divert(yytext+3); }

%%

static divert(s) char *s; {
	while (*s && isspace(*s))
		++s;
	if (!freopen(s, "w", stdout))
		perror(s);
}
