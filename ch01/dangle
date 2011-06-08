/*
 *		dangling else
 */

%token IF...THEN
%token ELSE

%%

statement
	: ';' /* empty */
	| IF...THEN statement
	| IF...THEN statement ELSE statement
