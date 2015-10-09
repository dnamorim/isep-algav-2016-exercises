/**
*	@file algav_pl1-ex7.pl
*	@brief ALGAV PL1: Exercício 7 PROLOG
*
*	@author Duarte Nuno Amorim (1130674@iseep.ipp.pt)
* @date Out 9, 2015
*	@bug None.
*/

/* Homens */
homem(marco).
homem(jose).
homem(joaquim).
homem(manuel).

/* Mulheres */
mulher(joaquina).

/* Parentesco */
pai(jose, marco).
pai(joaquim, jose).
pai(manuel, joaquim).
mae(joaquina, marco).

/* Cabelo */
cabelo(jose, loiro).
cabelo(joaquim, loiro).
cabelo(joaquina, loiro).
cabelo(manuel, preto).

cabelo(X,Y):-
  (pai(P,X),cabelo(P,Y)),
  (mae(M,X),cabelo(M,W)),
  (Y == W), (Y == loiro).

possui(jose,ouro).

/* Posses */
rico(X):-
  possui(X,ouro);
  ((pai(Z,X);mae(Z,X)),
  rico(Z)).

/* Mestiço */
mestico(X):-
  cabelo(X,Z),
	(pai(P,X);mae(P,X)),
  cabelo(P,H),
  ((Z \== H), true,!; mestico(P)).

mestico(X) :-
  cabelo(X,Z),
  (pai(P,X);mae(P,X)),
  (cabelo(P,H), Z \== H).
