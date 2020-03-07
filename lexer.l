%option main
letter        [a-zA-Z]
digit         [0-9]
signs         [+-]
number        {signs}?{digit}*(\.)?{digit}+
alphanumeric  {letter}+{(digit|letter)*}
string        \"[^\"]*\"
set           \{[((({number}|{string}|{alphanumeric})\,)*)({number}|{string}|{alphanumeric})]\}
%%
\=                  printf("ASSN_OP");
(alphanumeric)      printf("IDENTIFIER");
(number)            printf("NUMBER");
(string)            printf("STRING");
(set)               printf("SET");
\(                  printf("LP");
\)                  printf("RP");
\{                  printf("LB");
\}                  printf("RB");
\,                  printf("COMMA");
\:                  printf("COLON");
\;                  printf("SC");
\+                  printf("PLUS");
\*                  printf("MULTIPLY");
\/                  printf("DIVIDE");
\-                  printf("MINUS");
\<                  printf("LT");
\<\=                printf("LTE");
\>                  printf("GT");
\>\=                printf("GTE");
while               printf("WHILE");
for                 printf("FOR");
return              printf("RETURN");
print 				printf("PRINT")
if                  printf("IF");
else                printf("ELSE");
[\0]                printf("EOF")
%%
int yywrap() { return 1; }