/**
*	@file algav_pl3-ex1.pl
*	@brief ALGAV PL3
*
*	@author Duarte Nuno Amorim (1130674@isep.ipp.pt)
* @date Oct 8, 2015
*	@bug None.
*/

mulher(maria,30).
mulher(rosa,15).
mulher(teresa,21).

homem(pedro,18).
homem(tiago,43).

par(X,Y):- homem(X,_),mulher(Y,_).
mostra_par:- par(X,Y), write(X), write(' '), write(Y), nl, fail; true.

escolhe_par(X,Y,MAX,SOM):-
  MAX >= 36,
  homem(X,IX),
  mulher(Y,IY),
  SOM is IX+IY,
  SOM =< MAX.
