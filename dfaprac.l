%{
%}

%s B C D E F G DEAD INVALID

%%
<INITIAL>1 BEGIN B;
<INITIAL>0 BEGIN DEAD;
<INITIAL>[^0|\n] BEGIN INVALID;
<INITIAL>\n BEGIN INITIAL; printf("Not accepted.\n");
<B>0 BEGIN C;
<B>1 BEGIN DEAD;
<B>[^0|\n] BEGIN INVALID;
<B>\n BEGIN INITIAL; printf("Not accepted.\n");
<C>0 BEGIN DEAD;
<C>1 BEGIN D;
<C>[^0|\n] BEGIN INVALID;
<C>\n BEGIN INITIAL; printf("Not accepted.\n");
<D>0 BEGIN E;
<D>1 BEGIN D;
<D>[^0|\n] BEGIN INVALID;
<D>\n BEGIN INITIAL; printf("Not accepted.\n");
<E>0 BEGIN F;
<E>1 BEGIN D;
<E>[^0|\n] BEGIN INVALID;
<E>\n BEGIN INITIAL; printf("Not accepted.\n");
<F>0 BEGIN G;
<F>1 BEGIN D;
<F>[^0|\n] BEGIN INVALID;
<F>\n BEGIN INITIAL; printf("Not accepted.\n");
<G>0 BEGIN G;
<G>1 BEGIN G;
<G>[^0|\n] BEGIN INVALID;
<G>\n BEGIN INITIAL; printf("Accepted.\n");
<DEAD>0 BEGIN DEAD;
<DEAD>1 BEGIN DEAD;
<DEAD>[^0|\n] BEGIN INVALID;
<DEAD>\n BEGIN INITIAL; printf("Not accepted.\n");
<INVALID>0 BEGIN INVALID;
<INVALID>1 BEGIN INVALID;
<INVALID>[^0|\n] BEGIN INVALID;
<INVALID>\n BEGIN INITIAL; printf("Not valid.\n");
%%

int main()
{
	yylex();
	return 0;
}
