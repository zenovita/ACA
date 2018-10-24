%option main


ASSIGNOP =
OP_UNION #\+
OP_INTERSECT #&
OP_DIF #-
OP_COMP #!
OP_PRODUCT #\*
LCURLY_PAR \{
RCURLY_PAR \}
L_PAR \(
R_PAR \)
LSQR_PAR \[
RSQR_PAR \]
ELEMENT_OF @@
SYM_PROPERSUB \/\/
SYM_IMPROPERSUB \/\/\_
SYM_PROPERSUP \\\\
SYM_IMPROPERSUP \\\\\_
SET_NAME [A-Z][ \t]
REAL [+-]?[0-9]*(\.)?[0-9]+
VAR [A-Za-z]+
LESS \<
GREATER \>
LESS_EQ \<\=
GREATER_EQ \>\=
QUOTE \"
COMMA \,
SEMICOLON \;
COLON \:
DOT \.
COMMENT $$.*
METHOD_NAME @[a-z]+
ARRAY_NAME \[\][a-z]+
EQUALS_TO ==

%%
definitions printf("<DEFINITIONS>");
return printf("RETURN ");
perform printf("<PERFORM>");
if printf("IF ");
else printf("ELSE ");
in printf("IN ");
loop printf("LOOP ");
print printf("PRINT ");
printl printf("PRINT_LINE ");
void printf("VOID_TYPE ");
real printf("REAL_TYPE ");
{OP_UNION} printf("UNION ");
{OP_INTERSECT} printf("INTERSECT ");
{OP_DIF} printf("DIFFERENCE ");
{OP_COMP} printf("COMPLEMENT ");
{OP_PRODUCT} printf("CROSS_PRODUCT ");
{LCURLY_PAR} printf("LCURLY_PAR ");
{RCURLY_PAR} printf("RCURLY_PAR ");
{L_PAR} printf("L_PAR ");
{R_PAR} printf("R_PAR ");
{LSQR_PAR} printf("LSQR_PAR ");
{RSQR_PAR} printf("RSQR_PAR ");
{ASSIGNOP} printf("ASSIGN_OP ");
{ELEMENT_OF} printf("ELEMENT_OF ");
{SYM_SUBSET} printf("SUBSET ");
{SYM_SUPERSET} printf("SUPERSET ");
{SET_NAME} printf("SET_NAME ");
{VAR} printf("VAR ");
{REAL} printf("REAL ");
{LESS} printf("LESS_THAN ");
{GREATER} printf("GREATER_THAN ");
{LESS_EQ} printf("LESS_THAN_OR_EQUAL_TO ");
{GREATER_EQ} printf("GREATER_THAN_OR_EQUAL_TO ");
{COLON} printf("THAT_IS ");
{COMMA} printf("COMMA ");
{DOT} printf("DOT ");
{SEMICOLON} printf("SEMICOLON ");
{QUOTE} printf("QUOTE ");
{COMMENT} printf("COMMENT ");
{METHOD_NAME} printf("METHOD_NAME ");
{EQUALS_TO} printf("EQUALS_TO ");
%%
