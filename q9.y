%{
#include<stdio.h>
%}
%token NUMBER ID               
%left '+' '-'                       
%left '*' '/'
%%
stmt: expr {printf("VALUE= %d\n",$$);}
expr: expr '+' expr {$$=$1+$3;}                
     |expr '-' expr {$$=$1-$3;}
     |expr '*' expr {$$=$1*$3;}
     |expr '/' expr {$$=$1/$3;}
     |'-'NUMBER {$$=$2;}
     |'-'ID {$$=$2;}
     |'('expr')'{$$=$2;}
     |NUMBER {$$=$1;}
     |ID {$$=$1;}
     ;
%%
int main()
{
printf("Enter the expression\n");
yyparse();
}
int yyerror()
{
printf("\nExpression is invalid");
return 0;
}
