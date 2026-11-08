  GNU nano 7.2                                                 calwithlex.l
%{
#include "y.tab.h"
#include<stdio.h>
#include<stdlib.h>
%}
%%

[0-9]+ { yylval=atoi(yytext); return NUM;}

[+\-*/\n] { return yytext[0];}

\n return 0;
[ \t] ;

. { return yytext[0];}


%%

int yywrap()
{
return 1;
}






