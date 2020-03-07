%option main
letter        [a-zA-Z]
digit         [0-9]
signs         [+-]
number        {signs}?{digit}*(\.)?{digit}+
alphanumeric  {letter}?{(digit|letter)*}
%%
\+                  printf("PLUS");
\*                  printf("MULTIPLY");
\/                  printf("DIVIDE");
\-                  printf("MINUS");

%%
int yywrap() { return 1; }