%option main
letter        [a-zA-Z]
digit         [0-9]
signs         [+-]
number        {signs}?{digit}*(\.)?{digit}+
alphanumeric  {letter}+{(digit|letter)*}
%%
\(                  printf("LP")
\)                  printf("RP")
\{                  printf("LB")
\}                  printf("RB")
\,                  printf("COMMA")
\:                  printf("COLON")
\;                  printf("SC")
\+                  printf("PLUS");
\*                  printf("MULTIPLY");
\/                  printf("DIVIDE");
\-                  printf("MINUS");
[\0]                printf("EOF")
%%
int yywrap() { return 1; }