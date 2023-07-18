%{
int id = 0, op = 0,v = 0, flag;
%}

%%
[0-9]+ {id++; printf("%s is an identifier\n",yytext);}
[+*] {op++; printf("%s is an operator\n",yytext);}
"(" {v++;}
")" {if(v > 0) v--; else flag = 1; }
. {;}
\n {return 0;}
%%

void main() {
	printf("Enter an Expression :\n");
	yylex();
	if(flag == 0 && id == op + 1 && v == 0) {
		printf("Valid Expression\n");
	}
	else {
		printf("Invalid Expression\n");
	}
	printf("Total nunmber of identifiers = %d",id);
	printf("\nTotal number of operators = %d",op);
}
