%{
#include<stdio.h>
#include<stdlib.h>
%}

%token A B

%%
input : stt '\n' {printf("\nValid String\n"); 
		 exit(0);
		 }
	stt:B
		|A exp B
		;
	exp : A exp
		|
		;
%%

int main() {
	printf("\nEnter a string :\n");
	yyparse();
}

int yyerror() {
	printf("\nInvalid String\n");
	exit(0);
}
