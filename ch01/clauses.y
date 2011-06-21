/*
 *		multiple clauses
 */

%token IDENTIFIER IF THEN SUM

%%

statement
	: IDENTIFIER '=' expression
	| IF condition THEN statement

condition
	: expression
	| SUM '<' SUM

expression
	: SUM '<' SUM
	| SUM
