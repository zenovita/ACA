%{
#include <stdio.h>
#include <stdlib.h>
#define YYDEBUG 1
%}
/*aca*/
%token DEFINITIONS
%token RETURN
%token PERFORM
%token IF ELSE
%token LOOP
%token CONST
%token PRINT
%token PRINTL
%token DATA_TYPE
%token IN
%right ASSIGNOP
%left OP_UNION
%left OP_INTERSECT
%left OP_DIF
%left OP_COMP
%left OP_PRODUCT
%token LCURLY_PAR
%token RCURLY_PAR
%token L_PAR
%token R_PAR
%token LSQR_PAR
%token RSQR_PAR
%left ELEMENT_OF
%left SYM_PROPERSUB
%left SYM_IMPROPERSUB
%left SYM_PROPERSUP
%left SYM_IMPROPERSUP
%token SET_NAME
%token REAL
%token STRING
%token VAR
%left LESS
%left GREATER
%left LESS_EQ
%left GREATER_EQ
%token QUOTE
%token COMMA
%token SEMICOLON
%token COLON
%token DOT
%token COMMENT
%token METHOD_NAME
%token ARRAY_NAME
%nonassoc EQUALS_TO
%%

start: DEFINITIONS LCURLY_PAR definitions RCURLY_PAR SEMICOLON PERFORM LCURLY_PAR perform RCURLY_PAR;

definitions: 	   definition 
		|  definition definitions;

definition: functions | stmt;

functions: DATA_TYPE METHOD_NAME L_PAR parameter R_PAR LCURLY_PAR stmts RCURLY_PAR;

parameter: 	DATA_TYPE VAR                                                                          
		| empty;


perform: stmts
	|empty;

empty: ;



set: SET_NAME ASSIGNOP LCURLY_PAR set_var RCURLY_PAR;

set_var: set_elements |set_elements COMMA set_var;

set_elements: 	  REAL
		| STRING
		| LCURLY_PAR set_var RCURLY_PAR;

set_type: subset | superset;

set_operators:   set_union
		|set_intersect
		|set_dif
		|set_comp
		|set_product

set_union: SET_NAME ASSIGNOP L_PAR SET_NAME OP_UNION SET_NAME R_PAR

set_intersect: SET_NAME ASSIGNOP L_PAR SET_NAME OP_INTERSECT SET_NAME R_PAR

set_dif: SET_NAME ASSIGNOP L_PAR SET_NAME OP_DIF SET_NAME R_PAR

set_comp: SET_NAME ASSIGNOP L_PAR SET_NAME OP_COMP R_PAR

set_product: SET_NAME ASSIGNOP L_PAR SET_NAME OP_PRODUCT SET_NAME R_PAR



subset: proper_subset | improper_subset;

proper_subset: SET_NAME SYM_PROPERSUB SET_NAME;

improper_subset: SET_NAME SYM_IMPROPERSUB SET_NAME;

superset: proper_superset | improper_superset;

proper_superset: SET_NAME SYM_PROPERSUP SET_NAME;

improper_superset: SET_NAME SYM_IMPROPERSUP SET_NAME;



stmt: 	  output_stmt
	| input_stmt
	| return_stmt
	| loop_stmt
	| if_stmt
	| assign_stmt
	| function_call
	| constant
	| set
	| set_operators
	| comment
	| array;

function_call: METHOD_NAME L_PAR parameter R_PAR;

output_stmt:	  PRINT L_PAR VAR R_PAR
		| PRINTL L_PAR VAR R_PAR
		| PRINT L_PAR STRING  R_PAR
		| PRINTL L_PAR STRING R_PAR;

input_stmt: IN L_PAR set_elements R_PAR;

return_stmt: 	  RETURN VAR
		| RETURN REAL;

stmts: stmt |stmts stmt;

loop_stmt: LOOP L_PAR expr R_PAR LCURLY_PAR stmts RCURLY_PAR;


if_stmt: if_stmt_m
        |if_stmt_um;
        
if_stmt_m: IF L_PAR expr R_PAR LCURLY_PAR stmts RCURLY_PAR ELSE LCURLY_PAR stmts RCURLY_PAR;

if_stmt_um: IF L_PAR expr R_PAR LCURLY_PAR stmts RCURLY_PAR;


assign_stmt: 	 DATA_TYPE VAR ASSIGNOP REAL
		|DATA_TYPE VAR ASSIGNOP STRING;

expr: 	  set_elements
	| opt_inf
	| elmt_exp
	| equality_exp
	| set_type;

elmt_exp: set_elements ELEMENT_OF SET_NAME;

equality_exp: VAR EQUALS_TO set_elements;

constant: CONST DATA_TYPE VAR ASSIGNOP set_elements;

array: ARRAY_NAME ASSIGNOP LSQR_PAR array_elemt RSQR_PAR;

array_elemt: 	  REAL
		| REAL array_elemt;


opt_inf: 	  VAR op1 REAL 
 		| VAR op2 REAL 
  		| REAL op1 VAR
  		| REAL op2 VAR;

op1: LESS | LESS_EQ;

op2: GREATER | GREATER_EQ;

comment: COMMENT;


%%
#include "lex.yy.c"
int lineNo;
int state = 0;

int main() {
        yyparse();
        if(state == 0){
                printf("Parsing is successfully completed.\n");
        }
        return 0;
}
void yyerror( char *s ) { state = -1; fprintf( stderr, "%d: %s\n",lineNo+1,s); }
	