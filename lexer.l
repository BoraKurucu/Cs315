%option main
letter        [a-zA-Z]
digit         [0-9]
signs         [+-]
number        {signs}?{digit}*(\.)?{digit}+
alphanumeric  {letter}?{(digit|letter)*}
%%
\=                  printf("ASSN_OP");
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
%%
int yywrap() { return 1; }