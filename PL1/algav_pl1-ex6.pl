/**
*	@file algav_pl1.pl
*	@brief ALGAV PL1: Exercício 6 PROLOG
*
*	@author Duarte Nuno Amorim (1130674@iseep.ipp.pt)
* @date Sep 23, 2015
*	@bug None.
*/

/* Homens */
homem(joao).
homem(miguel).
homem(antonio).

/* Mulheres */
mulher(maria).
mulher(joana).
mulher(susana).
mulher(ana).

cabelo(joao,loiro).
cabelo(miguel,preto).
cabelo(antonio,preto).
cabelo(joana,loiro).
cabelo(susana,loiro).
cabelo(maria,moreno).
cabelo(ana,moreno).

rica(X):- possui(X,ouro).

possui(miguel,ouro).
possui(joana,ouro).
possui(ana,carro).
possui(joao,carro).

gosta(X,Y):-
  (homem(X),mulher(Y));
  (mulher(X),homem(Y)).

preferencia(joao,Y):-
  gosta(joao,Y),
  rica(Y),
  cabelo(Y,loiro).

preferencia(miguel,Y):-
    gosta(miguel,Y),
    rica(Y),
    cabelo(Y,moreno).

preferencia(maria,Y):-
  gosta(maria,Y),
  cabelo(Y,preto).

preferencia(joana,Y):-
    gosta(joana,Y),
    cabelo(Y,preto),
    rica(Y).

preferencia(X,Y):-
  /*(Y\==joao,Y\==miguel,Y\==maria,Y\==joana),*/
  gosta(X,Y),
  (X\==joao,X\==miguel,X\==maria,X\==joana).
