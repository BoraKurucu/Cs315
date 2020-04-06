%token  WHILE SET_IDE STR_IDE FOR RETURN PRINT IF ELSE FUNCTION  IDENTIFIER NUMBER STRING SET INPUT ASSN_OP DIFF_OP UNION_OP CARTESIAN_OP INTERSECTION_OP PULL_OP PUSH_OP CARDINALITY_OP POWERSET_OP SET_CONTAINS SET_DELETE LP RP LB RB COMMA COLON SC PLUS_OP MULTIPLY_OP DIVIDE_OP MOD_OP MINUS_OP AND OR LT LEQ GT GEQ EE NE ARROW
%%

program:   list  {printf("Input program is valid\n"); return 0;}

list  :  list_basic  |  list list_basic   
list_basic :  func_decl | stmt 

func_decl  : FUNCTION IDENTIFIER LP argument_list RP block | FUNCTION IDENTIFIER LP RP block

argument_list : primary | argument_list COMMA primary



 

block : LB list RB

delete_stmt : SET_IDE ARROW SET_DELETE LP RP SC


return_stmt :  RETURN expr_stmt 
stmt :  expr_stmt  | loop_stmt | return_stmt | block | set_pull | set_push | print_stmt| delete_stmt | assn_stmt |  if_stmt


if_stmt: IF LP logic_expr_list RP LB list RB | IF LP logic_expr_list RP LB list RB ELSE LB list RB



loop_stmt : for_stmt | while_stmt 



while_stmt : WHILE LP   logic_expr_list   RP block |
			   WHILE LP   logic_expr_list   RP  expr_stmt

for_stmt : FOR LP assn_stmt  logic_expr_list  expr RP block |
			 FOR LP assn_stmt  logic_expr_list  expr RP  expr_stmt | iterative_for


iterative_for :    FOR LP IDENTIFIER COLON SET RP expr_stmt |
	FOR LP IDENTIFIER COLON SET_IDE RP block |  FOR LP IDENTIFIER COLON SET RP block


print_stmt : PRINT LP expr RP SC | PRINT LP STRING RP SC 


logic_expr_list :  logic_expr_list general_comp_op logic_expr_list_basic | logic_expr_list general_comp_op LP logic_expr_list_basic RP | logic_expr_list_basic | LP logic_expr_list RP 
logic_expr_list_basic: primary general_comp_op primary 



contain_expr :  SET_IDE ARROW SET_CONTAINS LP argument_list RP 


assn_stmt  : string_assn SC | set_assn  SC | number_assn SC 



expr_stmt :expr SC
expr : number_expr | set_expr 

string_assn : STR_IDE ASSN_OP STRING | STR_IDE ASSN_OP INPUT LP RP| STR_IDE ASSN_OP INPUT LP STRING RP





number_assn : IDENTIFIER ASSN_OP number_expr 
number_expr :  number_expr general_comp_op number_addt | number_addt
number_addt :  number_addt basic_addition_op number_mult | number_mult 
number_mult  :   number_mult basic_multiplication_op number_call | number_call
number_call : IDENTIFIER LP argument_list RP | IDENTIFIER LP RP |  number_factor
number_factor  :  NUMBER | IDENTIFIER | LP number_expr RP | set_size | INPUT LP RP | INPUT LP STRING RP 


set_assn : IDENTIFIER ASSN_OP set_expr |  SET_IDE ASSN_OP set_expr
set_expr :  set_expr  general_comp_op set_arith | set_arith
set_arith :  set_arith  set_arith_op set_unary | set_unary 
set_unary  :   set_unary_op set_call | set_call
set_call : SET_IDE LP argument_list RP |SET_IDE LP RP | SET_IDE ARROW LP argument_list RP | contain_expr | set_basic
set_basic  :  SET | SET_IDE  | LP set_expr RP 




set_pull  : SET_IDE PULL_OP primary SC
set_push : SET_IDE PUSH_OP primary SC
set_size  : CARDINALITY_OP SET_IDE  | CARDINALITY_OP SET 

general_comp_op  : LT | LEQ | GT | GEQ | EE | NE | OR | AND 

set_arith_op : UNION_OP | INTERSECTION_OP |  DIFF_OP  | CARTESIAN_OP
set_unary_op : POWERSET_OP
 
basic_addition_op : PLUS_OP|MINUS_OP
basic_multiplication_op : MULTIPLY_OP|DIVIDE_OP|MOD_OP

primary : NUMBER | STRING | SET | IDENTIFIER | SET_IDE |  STR_IDE 



%%
#include "lex.yy.c"

int yyerror(char* s){
  fprintf(stderr, "%s on line %d\n",s, yylineno);
  return 1;
}

int main(){
  yyparse();
  return 0;
}