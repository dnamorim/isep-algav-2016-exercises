/**
*	@file algav_pl3-ex2.pl
*	@brief ALGAV PL2
*
*	@author Duarte Nuno Amorim (1130674@isep.ipp.pt)
* @date Oct 8, 2015
*	@bug None.
*/

cor(ceu, azul).
cor(ceu, cinzento).
cor(ceu, preto).
cor(mar, azul).
cor(mar, verde).
cor(mar, cinzento).
cor(via, cinzenta).
cor(via, castanha).
cor(via, preta).

transporte(ceu,aviao).
transporte(ceu,helicoptero).
transporte(ceu,foguete).
transporte(mar,navio).
transporte(mar,lancha).
transporte(via,carro).
transporte(via,camiao).
transporte(via,mota).
transporte(via,autocarro).

nega(X):- call(X),!,fail.
nega(_).

se_entao_senao(X,Y,Z):-
  call(X),!,call(Y);call(Z).

se_entao(X,Y):-
  (call(X),call(Y),!);true.

questao(VAL):-
  write("Atributo? "),
  read(AT),
  write("Objecto? "),
  read(OBJ),
  repeat,
  write("Valor do/da "),write(AT),write(" do/da "),write(OBJ),write("?"),
  read(VAL),
  EX =.. [AT,OBJ,VAL],
  call(EX).
