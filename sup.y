%token  WHILE FOR RETURN PRINT IF ELSE FUNCTION  IDENTIFIER NUMBER STRING SET INPUT ASSN_OP DIFF_OP UNION_OP CARTESIAN_OP INTERSECTION_OP PULL_OP PUSH_OP CARDINALITY_OP POWERSET_OP SET_CONTAINS SET_DELETE LP RP LB RB COMMA COLON SC PLUS_OP MULTIPLY_OP DIVIDE_OP MOD_OP MINUS_OP AND OR LT LEQ GT GEQ EE NE ARROW
%%

program:   list {printf("Input program is valid\n"); return 0;} | empty {printf("Input program is valid\n"); return 0;} 

list  :  declaration  |  list declaration   
declaration : var_decl | func_decl | stmt 

var_decl : IDENTIFIER SC 
func_decl  : FUNCTION IDENTIFIER LP argument_list RP block | FUNCTION IDENTIFIER LP RP block

argument_list : primary | argument_list COMMA primary



stmt : matched | unmatched 

block : LB list RB

delete_stmt : IDENTIFIER ARROW SET_DELETE LP RP SC


return_stmt :  RETURN expr_stmt 
non_if_stmt :  expr_stmt  | loop_stmt | return_stmt | block | set_pull | set_push | print_stmt| delete_stmt | assn_stmt 


matched : IF LP logic_expr_list RP matched ELSE matched | non_if_stmt

unmatched : IF  LP logic_expr_list RP stmt
 |IF  LP logic_expr_list RP  matched ELSE unmatched



loop_stmt : for_stmt | while_stmt 



while_stmt : WHILE LP   logic_expr_list   RP block |
			   WHILE LP   logic_expr_list   RP  expr_stmt

for_stmt : FOR LP assn_stmt  logic_expr_list  expr RP block |
			 FOR LP assn_stmt  logic_expr_list  expr RP  expr_stmt | iterative_for


iterative_for :  FOR LP IDENTIFIER COLON IDENTIFIER RP expr_stmt |  FOR LP IDENTIFIER COLON SET RP expr_stmt |
	FOR LP IDENTIFIER COLON IDENTIFIER RP block |  FOR LP IDENTIFIER COLON SET RP block


print_stmt : PRINT LP expr RP SC | PRINT LP STRING RP SC 


logic_expr_list : logic_list 


logic_list : expr | logic_list general_comp_op  expr | LP logic_list RP


contain_expr :  IDENTIFIER ARROW SET_CONTAINS LP argument_list RP | IDENTIFIER ARROW SET_CONTAINS LP argument_list RP 


assn_stmt  : string_assn SC | set_assn  SC | number_assn SC 



expr_stmt :expr SC
expr : number_expr | set_expr 

string_assn : IDENTIFIER ASSN_OP STRING | IDENTIFIER ASSN_OP INPUT LP RP| IDENTIFIER ASSN_OP INPUT LP STRING RP





number_assn : IDENTIFIER ASSN_OP number_expr 
number_expr :  number_expr general_comp_op number_addt | number_addt
number_addt :  number_addt basic_addition_op number_mult | number_mult 
number_mult  :   number_mult basic_multiplication_op number_call | number_call
number_call : IDENTIFIER LP argument_list RP | IDENTIFIER LP RP |  number_factor
number_factor  :  NUMBER | IDENTIFIER | LP number_expr RP | set_size | INPUT LP RP | INPUT LP STRING RP




set_assn : IDENTIFIER ASSN_OP set_expr 
set_expr :  set_expr  general_comp_op set_arith | set_arith
set_arith :  set_arith  set_arith_op set_unary | set_unary 
set_unary  :   set_unary_op set_basic | set_call
set_call : IDENTIFIER LP argument_list RP |IDENTIFIER LP RP | set_basic ARROW LP argument_list RP | contain_expr | set_basic
set_basic  :  SET | IDENTIFIER  | LP set_expr RP 



set_pull  : IDENTIFIER PULL_OP primary SC
set_push : IDENTIFIER PUSH_OP primary SC
set_size  : CARDINALITY_OP IDENTIFIER  | CARDINALITY_OP SET 

general_comp_op  : LT | LEQ | GT | GEQ | EE | NE | OR | AND 

set_arith_op : UNION_OP | INTERSECTION_OP |  DIFF_OP  | CARTESIAN_OP
set_unary_op : POWERSET_OP
 
basic_addition_op : PLUS_OP|MINUS_OP
basic_multiplication_op : MULTIPLY_OP|DIVIDE_OP|MOD_OP

primary : NUMBER | STRING | SET | IDENTIFIER

empty : ;

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