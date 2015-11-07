/**
*	@file algav_exercicioPratico1.pl
*	@brief ALGAV PL3
*
*	@author Duarte Nuno Amorim (1130674@isep.ipp.pt)
* @date Oct 14, 2015
*	@bug None.
*/

%produto(Codigo,Nome)
produto(1,mesa).
produto(2,tampo).
produto(3,perna).
produto(4,gaveta).
produto(5,armario).
produto(6,porta).
produto(7,prateleira).
produto(8,puxador).

%composicao(Codigo1,Codigo2,Qtd)
composicao(1,2,1).
composicao(1,3,4).
composicao(1,4,2).
composicao(5,6,2).
composicao(5,7,4).
composicao(6,8,1).
composicao(4,8,1).

produtoNaoUsadoComposicao(C,N):-
  produto(C,N),
  not(composicao(C,_,_)).
