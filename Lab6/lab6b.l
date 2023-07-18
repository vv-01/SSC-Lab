%{
#include <stdio.h>
#include "y.tab.h"
extern int yylval;
%}

%%
[\t] ;
[+|-|*|/|=|<|>] {printf("%s is an operator\n", yytext); 
                  return OP;
                 }
[0-9]+ {yylval = atoi(yytext);
         printf("%d is a number\n", yylval); 
         return DIGIT;
        }
int|char|boolean|float|void|for|do|while|if|else|return {printf("%s is a keyword\n", yytext); 
                                                        return KEY;
                                                       }
[a-zA-Z_][A-Za-z_0-9]+ {printf("%s is an identifier\n", yytext);
                        return ID;
                       }
. ;
%%

int yywrap() {
    return 1;
}

