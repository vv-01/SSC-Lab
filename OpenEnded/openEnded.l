%{
#include "y.tab.h"
%}
num [0-9]+
id [_a-zA-z]+
bop =|<|>|!=|<=|>=|==|&&|"||"|[+-/*]
uop "++"|"--"
%%
"while" {return WHILE;}
"printf" {return PRINTF;}
\"[^\"\n]*\" {  return STRING; }
{bop} {return BOP;}
{uop} {return UOP; }
{num} {return NUMBER;}
{id} {return ID;}
[ \n\t] ;
. {return *yytext;}
%%
int yywrap()
{
return 1;
}