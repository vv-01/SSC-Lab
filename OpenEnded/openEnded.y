%{
#include<stdio.h>
%}
%token ID BOP UOP NUMBER WHILE PRINTF STRING
%%
prg:WHILE'('lexp')'codeblock {printf("It's a While Loop\n"); exit(0);}
	;
codeblock:'{'stmt_list'}'
	;
stmt_list:stmt_list stmt
	|
	;
stmt:lexp';'
	|PRINTF'('STRING')'';'
	;
lexp:fexp
	;
fexp:fexp','exp
	|exp
	;
exp:ID'('fexp')'
	|ID BOP exp
	|ID UOP
	|UOP ID
	|ID
	|NUMBER
	;
%%
int main()
{
	printf("Enter the statement:\n");
	yyparse();
}
int yyerror()
{
	printf("Error\n");
}
