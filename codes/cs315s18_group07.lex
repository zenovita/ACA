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
SET_NAME [A-Z]\-
REAL [+-]?[0-9]*(\.)?[0-9]+
STRING \".*\"
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
COMMENT \$\$.*
METHOD_NAME @[a-z]+
ARRAY_NAME \[\][a-z]+
EQUALS_TO ==

%%

definitions {return DEFINITIONS;}
return {return RETURN;}
const {return CONST;}
perform {return PERFORM;}
if {return IF;}
else {return ELSE;}
in {return IN;}
loop {return LOOP;}
print {return PRINT;}
printl {return PRINTL;}
string {return DATA_TYPE;}
void {return DATA_TYPE;}
real {return DATA_TYPE ;}
{OP_UNION} {return OP_UNION;}
{OP_INTERSECT} {return OP_INTERSECT;}
{OP_DIF} {return OP_DIF;}
{OP_COMP} {return OP_COMP;}
{OP_PRODUCT} {return OP_PRODUCT;}
{LCURLY_PAR} {return LCURLY_PAR;}
{RCURLY_PAR} {return RCURLY_PAR;}
{L_PAR} {return L_PAR;}
{R_PAR} {return R_PAR;}
{LSQR_PAR} {return LSQR_PAR;}
{RSQR_PAR} {return RSQR_PAR;}
{ASSIGNOP} {return ASSIGNOP;}
{ELEMENT_OF} {return ELEMENT_OF;}
{SYM_PROPERSUB} {return SYM_PROPERSUB;}
{SYM_IMPROPERSUB} {return SYM_IMPROPERSUB;}
{SYM_PROPERSUP} {return SYM_PROPERSUP;}
{SYM_IMPROPERSUP} {return SYM_IMPROPERSUP;}

{VAR} {return VAR;}
{SET_NAME} {return SET_NAME;}
{REAL} {return REAL;}
{STRING} {return STRING;}
{LESS} {return LESS;}
{GREATER} {return GREATER;}
{LESS_EQ} {return LESS_EQ;}
{GREATER_EQ} {return GREATER_EQ;}
{COLON} {return COLON;}
{COMMA} {return COMMA;}
{DOT} {return DOT;}
{SEMICOLON} {return SEMICOLON;}
{QUOTE} {return QUOTE;}
{COMMENT} {return COMMENT;}
{METHOD_NAME} {return METHOD_NAME;}
{EQUALS_TO} {return EQUALS_TO;}
{ARRAY_NAME} {return ARRAY_NAME;}

%%
int yywrap() { return 1; }