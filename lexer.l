%option main
letter        [a-zA-Z]
digit         [0-9]
signs         [+-]
number        {signs}?{digit}*(\.)?{digit}+
alphanumeric  {letter}?{(digit|letter)*}
%%