%token  WHILE FUNC SET_IDE STR_IDE FOR RETURN PRINT IF ELSE FUNCTION  IDENTIFIER NUMBER STRING SET_INIT  INPUT ASSN_OP DIFF_OP UNION_OP CARTESIAN_OP INTERSECTION_OP PULL_OP PUSH_OP CARDINALITY_OP POWERSET_OP SET_CONTAINS SET_DELETE LP RP LB RB COMMA COLON SC PLUS_OP MULTIPLY_OP DIVIDE_OP MOD_OP MINUS_OP AND OR LT LEQ GT GEQ EE NE ARROW

%nonassoc LESS_ELSE
%nonassoc ELSE

%%

program:   list  {printf("Input program is valid\n"); return 0;}

list  :  list_basic  |  list list_basic   
list_basic :  func_decl | stmt 

func_decl  : FUNCTION IDENTIFIER LP argument_list RP block | FUNCTION IDENTIFIER LP RP block



argument_list : primary | argument_list COMMA argument_list | LB argument_list RB  | argument_list COMMA LB primary RB


 

block : LB list RB

delete_stmt : SET_IDE ARROW SET_DELETE LP RP SC


return_stmt :  RETURN expr_stmt 
stmt :  expr_stmt  | loop_stmt | return_stmt | block | set_pull | set_push | print_stmt| delete_stmt | assn_stmt |  if_stmt


if_stmt: IF LP expr RP stmt %prec LESS_ELSE | IF LP expr RP stmt ELSE stmt



loop_stmt : for_stmt | while_stmt 



while_stmt : WHILE LP   expr   RP block |
			   WHILE LP   expr   RP  expr_stmt

for_stmt : FOR LP assn_stmt  expr  expr RP block |
			 FOR LP assn_stmt  expr  expr RP  expr_stmt | iterative_for


iterative_for :    FOR LP IDENTIFIER COLON SET RP expr_stmt |
	FOR LP IDENTIFIER COLON SET_IDE RP block |  FOR LP IDENTIFIER COLON SET RP block


print_stmt : PRINT LP expr RP SC | PRINT LP STRING RP SC 



contain_expr :  SET_IDE ARROW SET_CONTAINS LP argument_list RP 


assn_stmt  : string_assn SC | set_assn  SC | number_assn SC 



expr_stmt :expr SC
expr : number_expr | set_expr 

string_assn : STR_IDE ASSN_OP STRING | STR_IDE ASSN_OP INPUT LP RP| STR_IDE ASSN_OP INPUT LP STRING RP | STR_IDE ASSN_OP STR_IDE | FUNC STR_IDE LP argument_list RP | FUNC STR_IDE LP RP
		





number_assn : IDENTIFIER ASSN_OP number_expr 
number_expr :  number_expr general_comp_op number_addt | number_addt
number_addt :  number_addt basic_addition_op number_mult | number_mult 
number_mult  :   number_mult basic_multiplication_op number_call | number_call
number_call : 	FUNC IDENTIFIER LP argument_list RP | FUNC IDENTIFIER LP RP | number_basic
number_basic  :  NUMBER | IDENTIFIER | LP number_expr RP | set_size | INPUT LP RP | INPUT LP STRING RP


set_assn : SET_IDE ASSN_OP set_expr | IDENTIFIER ASSN_OP set_expr
set_expr :  set_expr  general_comp_op set_arith | set_arith
set_arith :  set_arith  set_arith_op set_unary | set_unary 
set_unary  :   set_unary_op set_basic | set_call
set_call : FUNC SET_IDE LP argument_list RP | FUNC SET_IDE LP RP | set_basic
set_basic  :  SET | SET_IDE | LP set_expr RP | contain_expr


SET: SET_INIT | LB argument_list RB

set_pull  : SET_IDE PULL_OP primary SC
set_push : SET_IDE PUSH_OP primary SC
set_size  : CARDINALITY_OP SET_IDE  | CARDINALITY_OP SET 

general_comp_op  : LT | LEQ | GT | GEQ | EE | NE | OR | AND 

set_arith_op : UNION_OP | INTERSECTION_OP |  DIFF_OP  | CARTESIAN_OP
set_unary_op : POWERSET_OP
 
basic_addition_op : PLUS_OP|MINUS_OP
basic_multiplication_op : MULTIPLY_OP|DIVIDE_OP|MOD_OP

primary : NUMBER | STRING | SET_INIT | IDENTIFIER | SET_IDE |  STR_IDE 

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