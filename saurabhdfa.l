%{
%}

%s B C D E DEAD INVALID

%%
<INITIAL>0 BEGIN B;
<INITIAL>1 BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL;printf("not accepted\n");
<INITIAL>[^0|\n] BEGIN INVALID;
<B>0 BEGIN C;
<B>1 BEGIN DEAD;
<B>\n BEGIN INITIAL;printf("not accepted\n");
<B>[^0|\n] BEGIN INVALID;
<C>0 BEGIN C;
<C>1 BEGIN D;
<C>\n BEGIN INITIAL;printf("not accepted\n");
<C>[^0|\n] BEGIN INVALID;
<D>0 BEGIN C;
<D>1 BEGIN E;
<D>\n BEGIN INITIAL;printf("not accepted\n");
<D>[^0|\n] BEGIN INVALID;
<E>0 BEGIN C;
<E>1 BEGIN E;
<E>\n BEGIN INITIAL;printf(" accepted\n");
<E>[^0|\n] BEGIN INVALID;
<DEAD>0 BEGIN DEAD;
<DEAD>1 BEGIN DEAD;
<DEAD>\n BEGIN INITIAL;printf("not accepted\n");
<DEAD>[^0|\n] BEGIN INVALID;
<INVALID>0 BEGIN INVALID;
<INVALID>1 BEGIN INVALID;
<INVALID>[^0|\n] BEGIN INVALID;
<INVALID>\n BEGIN INITIAL;printf("not VALID\n");
%%
int main()
{
yylex();
return 0;
}
