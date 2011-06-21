/*
 *		sample c
 *		syntax analysis
 *		(s/r conflict: one on ELSE)
 */

/*
 *		terminal symbols
 */

%token Identifier
%token Constant
%token INT
%token IF
%token ELSE
%token WHILE
%token BREAK
%token CONTINUE
%token RETURN
%token ';'
%token '('
%token ')'
%token '{'
%token '}'
%token '+'
%token '-'
%token '*'
%token '/'
%token '%'
%token '>'
%token '<'
%token GE	/* >= */
%token LE	/* <- */
%token EQ	/* == */
%token NE	/* != */
%token '&'
%token '^'
%token '|'
%token '='
%token PE	/* += */
%token ME	/* -= */
%token TE	/* *= */
%token DE	/* /= */
%token RE	/* %= */
%token PP	/* ++ */
%token MM	/* -- */
%token ','

/*
 *		precedence table
 */

%right	'=' PE ME TE DE RE
%left	'|'
%left	'^'
%left	'&'
%left	EQ NE
%left	'<' '>' GE LE
%left	'+' '-'
%left	'*' '/' '%'
%right	PP MM

%%

program
	: definitions

definitions
	: definition
	| definitions definition

definition
	: function_definition
	| INT function_definition
	| declaration

function_definition
	: Identifier '(' optional_parameter_list ')' parameter_declarations compound_statement

optional_parameter_list
	: /* no formal parameters */
	| parameter_list

parameter_list
	: Identifier
	| parameter_list ',' Identifier

parameter_declarations
	: /* null */
	| parameter_declarations parameter_declaration

parameter_declaration
	: INT parameter_declarator_list ';'

parameter_declarator_list
	: Identifier
	| parameter_declarator_list ',' Identifier

compound_statement
	: '{' declarations statements '}'

declarations
	: /* null */
	| declarations declaration

declaration
	: INT declarator_list ';'

declarator_list
	: Identifier
	| declarator_list ',' Identifier

statements
	: /* null */
	| statements statement

/* we'll get a shift/reduce because of the dangeling else, it's OK though */
statement
	: expression ';'
	| ';' /* null statement */
	| BREAK ';'
	| CONTINUE ';'
	| RETURN ';'
	| RETURN expression ';'
	| compound_statement
	| if_prefix statement
	| if_prefix statement ELSE statement
	| loop_prefix statement

if_prefix
	: IF '(' expression ')'

loop_prefix
	: WHILE '(' expression ')'

expression
	: binary
	| expression ',' binary

binary
	: Identifier
	| Constant
	| '(' expression ')'
	| Identifier '(' optional_argument_list ')'
	| PP Identifier
	| MM Identifier
	| binary '+' binary
	| binary '-' binary
	| binary '*' binary
	| binary '/' binary
	| binary '%' binary
	| binary '>' binary
	| binary '<' binary
	| binary GE binary
	| binary LE binary
	| binary EQ binary
	| binary NE binary
	| binary '&' binary
	| binary '^' binary
	| binary '|' binary
	| Identifier '=' binary
	| Identifier PE binary
	| Identifier ME binary
	| Identifier TE binary
	| Identifier DE binary
	| Identifier RE binary

optional_argument_list
	: /* no actual arguments */
	| argument_list

argument_list
	: binary
	| argument_list ',' binary
