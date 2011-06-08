/*
 *		multiple clauses, fixed
 */

%token IDENTIFIER IF THEN SUM

%%

statement
	: IDENTIFIER '=' expression
	| IF expression THEN statement

expression
	: SUM '<' SUM
	| SUM
