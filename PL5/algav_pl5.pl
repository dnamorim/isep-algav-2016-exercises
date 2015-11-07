/**
*	@file algav_pl5.pl
*	@brief ALGAV PL5 - Listas
*
*	@author Duarte Nuno Amorim (1130674@isep.ipp.pt)
* @date Oct 22, 2015
*	@bug None.
*/

/* Exercício 1a) Eliminar apenas a primeira ocorrência de um elemento */
elimina1(_,[],[]).
elimina1(X,[X|L],L).
elimina1(X,[Y|L1],[Y|L2]):-
  elimina1(X,L1,L2),!.

/* Exercício 2b) Eliminar todas as ocorrências de um elemento */
elimina_todos(_,[],[]).
elimina_todos(X,[X|L1],L2):-
  elimina_todos(X,L1,L2).
elimina_todos(X,[Y|L1],[Y|L2]):-
  elimina_todos(X,L1,L2),!.

/* Exercício 2) Apresentar todas as listas possºiveis de serem construídas com
  a lista passada por parâmetro */
p([],[]).
p(L,[X|L1]):-
  elimina1(X,L,Li),
  p(Li,L1).

/* Exercício 3) Substitui todas as ocorrências de um elemento numa lista */
substitui(_,_,[],[]).
substitui(X,Y,[X|L1],[Y|L2]):-
  substitui(X,Y,L1,L2),!.
substitui(X,Y,[Z|L1],[Z|L2]):-
  substitui(X,Y,L1,L2).

/* Exercício 4) Insere elemento numa dada posição de uma Lista */
insere(X,1,L,[X|L]).
insere(X,N,[Y|L1],[Y|L2]):-
  N1 is N-1,
  insere(X,N1,L1,L2).

/* Exercício 5) Inverter Lista originando outra */
inverte(L,LF):-
  innerInverte(L,[],LF).

innerInverte([],L,L).
innerInverte([X|L],LI,LF):-
  innerInverte(L,[X|LI],LF).


/* Exercício 6) União de duas Listas */
uniao([],L,L).
uniao([X|L1],L2,LF):-
  member(X,L2),!,
  uniao(L1,L2,LF).
uniao([X|L1],L2,[X|LF]):-
  uniao(L1,L2,LF).

/* Exercício 6b) Intersecção entre dois conjuntos */
interseccao([],_,[]).
interseccao([X|L],L1,[X|L2]):-
  member(X,L1),!,
  interseccao(L,L1,L2).
interseccao([_|L],L1,L2):-
  interseccao(L,L1,L2).

/* Exercício 6c) Diferença (Elementos da Lista L1 que não estejam em L2)*/
diferenca([],_,[]).
diferenca([X|L1],L2,LF):-
  member(X,L2),!,
  diferenca(L1,L2,LF).
diferenca([X|L1],L2,[X|LF]):-
  diferenca(L1,L2,LF).

/* Exercício 7) Totobola */
totobola([],[]).
totobola([X|L],[Y|LS]):-
  is_list(X),
  member(Y,X),
  totobola(L,LS).
totobola([X|L],[X|LS]):-
  totobola(L,LS).

/* Exercício 8) Totoloto */
totoloto(L1, L2):-
  get(6,L1,L2).

get(0,_,[]):-!.
get(N,[X|L1],[X|L2]):-
  N1 is N-1,
  get(N1,L1,L2).
get(N,[_|L1],L2):-
  get(N,L1,L2).
