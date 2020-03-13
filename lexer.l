%option main
letter        [a-zA-Z]
digit         [0-9]
signs         [+-]
number        {signs}?{digit}*(\.)?{digit}+
alphanumeric  {letter}+({digit}|{letter})*
string        \"[^\"]*\"
element       ({number}|{string}|{alphanumeric})
set           \{(({element}\,)*{element})?\}
%%
"//".* 			    printf("COMMENT ");
setContains         printf("SET_CONTAINS");
setDelete			printf(SET_DELETE);
input				printf("INPUT");
while               printf("WHILE ");
for                 printf("FOR ");
return              printf("RETURN ");
print 				      printf("PRINT ");
if                  printf("IF ");
else                printf("ELSE ");
function            printf("FUNCTION ");                  
true|false          printf("BOOL ");
{alphanumeric}      printf("IDENTIFIER ");
{number}            printf("NUMBER ");
{string}            printf("STRING ");
{set}               printf("SET ");
\=                  printf("ASSN_OP ");
\:\-				        printf("DIFF_OP ");
\:\+				        printf("UNION_OP ");
\:\x                printf("CARTESIAN_OP ");
\:\&                printf("INTERSECTION_OP ");
\>\>				        printf("PULL_OP ");
\<\<                printf("PUSH_OP ");
\#                  printf("CARDINALITY_OP ");
\^                  printf("POWERSET_OP ");
\(                  printf("LP ");
\)                  printf("RP ");
\{                  printf("LB ");
\}                  printf("RB ");
\,                  printf("COMMA ");
\:                  printf("COLON ");
\;                  printf("SC ");
\+                  printf("PLUS_OP ");
\*                  printf("MULTIPLY_OP ");
\/                  printf("DIVIDE_OP ");
\%                  printf("MOD_OP ");
\-                  printf("MINUS_OP ");
\&\&                printf("AND ");
\|\|                printf("OR ");
\<                  printf("LT ");
\<\=                printf("LEQ ");
\>                  printf("GT ");
\>\=                printf("GEQ ");
\=\=                printf("EE ");
\!\=                printf("NE ");
%%