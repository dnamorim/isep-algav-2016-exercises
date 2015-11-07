/**
*	@file algav_pl4.pl
*	@brief ALGAV PL4 - Introdução às Listas
*
*	@author Duarte Nuno Amorim (1130674@isep.ipp.pt)
* @date Oct 15, 2015
*	@bug None.
*/

/* Exercício 1) Predicado Membro */
membro(X,[X|_]).
membro(X,[_|L]):-
  membro(X,L).

/* Exercício 2) Predicado Concatena */
concatena([ ],L,L).
concatena([A|B],C,[A|D]):-
  concatena(B,C,D).

/* Exercício 3a) Contar Elementos de uma Lista */
contaLista([],0).
contaLista([_|L],N):-
  contaLista(L,N1), N is N1+1.

/* Exercício 3b) Somar Elementos de uma Lista */
somaLista([],0).
somaLista([E|L],S):-
  somaLista(L,S1),
  S is E + S1.

/* Exercício 3c) Média de Elementos de uma Lista */
mediaLista(L,N):-
  somaLista(L,S), % Obter a Soma dos Elementos todos da Lista
  contaLista(L,C), % Obter o número de elementos da Lista
  N is S/C.

/* Exercício 3d) Menor valor de entre os Elementos de uma Lista */
menor([X],X).
menor([X|R],M1):-
  menor(R,M1),
  M1 < X.
menor([X|_],X).

/* Exercício 3e) Contar Elementos num Range */
contaRangeLista([],_,_,0).
contaRangeLista([E|L],DWN,UP,N):-
  (E >= DWN, E =< UP),
  contaRangeLista(L,DWN,UP,N1),
  N is N1 + 1.
contaRangeLista([E|L],DWN,UP,N):-
  (E < DWN; E > UP),
  contaRangeLista(L,DWN,UP,N).

/* Exercício 4) Tem sucesso se L for uma Lista */
lista([]).
lista([_|T]):-
  lista(T).
