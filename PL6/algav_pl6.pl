/**
*	@file algav_pl6.pl
*	@brief ALGAV PL5 - Listas
*
*	@author Duarte Nuno Amorim (1130674@isep.ipp.pt)
* @date Oct 22, 2015
*	@bug None.
*/

/* Exercício 1 */
/* Grafo */
liga(a,b).
liga(a,c).
liga(a,d).
liga(b,e).
liga(b,f).
liga(c,f).
liga(c,g).
liga(d,a).
liga(d,g).
liga(d,h).
liga(d,i).
liga(e,j).
liga(f,a).
liga(f,j).
liga(f,k).
liga(g,f).
liga(g,h).
liga(g,o).
liga(h,d).
liga(h,l).
liga(i,l).
liga(j,m).
liga(j,n).
liga(k,n).
liga(k,p).

/* a) Descrever Caminho Correspondente */
caminho(O,O,_,[O]).
caminho(O,D,V,[O|L]):-
  liga(O,X),
  not(member(X,V)),
  caminho(X,D,[X|V],L).
caminho(O,D,L):-
  caminho(O,D,[O],L).

/* b) Predicado com todos os caminhos possíveis entre o nó origem e nó destino */
todosCaminhos(O,D,TC):-
  findall(C, caminho(O,D,C), TC).

/* c) Encontrar o caminho que passa pelo menor numero de cidades */
menorLista([X],X).
menorLista([X|L],M):-
  menorLista(L,M),
  length(M,LM),
  length(X,LX),
  LM < LX.
menorLista([X|_],X).

menorCaminho(O,D,ML):-
  todosCaminhos(O,D,L),
  menorLista(L,ML),!.

/* Exercício 2 */
linha(1,[a,b,c,d,e,f]).
linha(2,[g,b,h,i,j,k]).
linha(3,[l,j,m,n,o,d,p]).
linha(4,[f,q,r,s,t]).
linha(5,[t,u,j,v,a,g]).

/* a) Corrigir Predicado cruzamento */
geraCruzamentos:-
  retractall(cruza(_,_,_)),
  findall(_,cruzamento,_).

cruzamento:-
  linha(N1,LE1),
  linha(N2,LE2),
  intersection(LE1,LE2,LI),
  LI \= [], % não fazer assert quando a intersecção é vazias
  not(LE1 == LE2), % não fazer assert quando as listas são iguais
  assertz(cruza(N1,N2,LI)).

/* b) Predicado geraEstacoes que criar um facto estacoes onde nao apareçam
estacoes repetidas */
geraEstacoes:-
  retractall(estacoes(_,_,_)),
  findall(_,estacoes,_).

estacoes:-

une([L],L).
une([L1,L2|R],F):-
  union(L1,L2,L3),
  une([L3|R],F).
