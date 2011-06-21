/*
 *		first example of a yacc grammar
 */

 %token IDENTIFIER

 %%

 expression
 	: expression '-' IDENTIFIER
	| IDENTIFIER
