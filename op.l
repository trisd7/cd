%{
#include<stdio.h>
%}
ar  ("+"|"-"|"*"|"/")
inc ("++")
dec ("--")
log ("||"|"&&"|"!"|"~")
bit ("&"|"|"|"!"|">>"|"<<")
rel ("=="|">="|"<="|">"|"<")
cod (":"|"?")
as ("=")
%%
{ar} {printf("\n %s is an arithmetic operator",yytext);}
{inc} {printf("\n %s is an incremental operator",yytext);}
{dec} {printf("\n %s is an decremental operator",yytext);}
{log} {printf("\n %s is an logical operator",yytext);}
{bit} {printf("\n %s is an bitwise operator",yytext);}
{rel} {printf("\n %s is an relational operator",yytext);}
{cod} {printf("\n %s is an conditional operator",yytext);}
{as} {printf("\n %s is an assignment operator",yytext);}
%%

int yywrap()
{
return 1;
}

int main(){
yylex();
return 0;
}

