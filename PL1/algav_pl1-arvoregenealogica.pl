/**
*	@file algav_pl1.pl
*	@brief ALGAV PL1: Exercício PROLOG Árvore Genealógica
*
*	@author Duarte Nuno Amorim (1130674@isep.ipp.pt)
* @date Sep 17, 2015
*	@bug None.
*/

/* Exercício 1 */
/* Factos Homens */
homem(anibal).
homem(manuel).
homem(jose).
homem(fernando).
homem(francisco).
homem(alvaro).
homem(carlos).
homem(paulo).
homem(ricardo).
homem(daniel).
homem(samuel).

/* Factos Mulheres */
mulher(maria).
mulher(alzira).
mulher(marta).
mulher(diana).
mulher(celia).
mulher(delfina).
mulher(zulmira).
mulher(fatima).
mulher(sara).
mulher(adriana).

/* Factos Casados */
casados(manuel,maria).
casados(anibal,alzira).
casados(jose,marta).
casados(fernando,diana).
casados(alvaro,celia).
casados(carlos,zulmira).
casados(paulo,fatima).

/* Factos Descendentes Directos */
descendente_directo(marta,manuel,maria).
descendente_directo(fernando,manuel,maria).
descendente_directo(diana,anibal,alzira).
descendente_directo(francisco,anibal,alzira).
descendente_directo(alvaro,anibal,alzira).
descendente_directo(carlos,fernando,diana).
descendente_directo(paulo,fernando,diana).
descendente_directo(delfina,jose,marta).
descendente_directo(sara,alvaro,celia).
descendente_directo(ricardo,zulmira,carlos).
descendente_directo(daniel,zulmira,carlos).
descendente_directo(adriana,paulo,fatima).
descendente_directo(samuel,paulo,fatima).

/* Exercício 3 */
/* Regra Filhos */
filho(X,Y):-
	homem(X),
	(descendente_directo(X,Y,_);descendente_directo(X,_,Y)).

filha(X,Y):-
	mulher(X),
	(descendente_directo(X,Y,_);descendente_directo(X,_,Y)).

/* Regra Pais */
pai(X,Y):-
	homem(X),
	(filho(Y,X);filha(Y,X)).

mae(X,Y):-
	mulher(X),
	(filho(Y,X);filha(Y,X)).

/* Regra Avós */
avo_h(X,Y):-
	pai(X,Z),
	(pai(Z,Y);mae(Z,Y)).

avo_m(X,Y):-
	mae(X,Z),
	(pai(Z,Y);mae(Z,Y)).

/* Regra Netos */
neto(X,Y):-
	homem(X),
	avo_h(Y,X).

neta(X,Y):-
	mulher(X),
	avo_h(Y,X).

/* Regra Irmãos */
irmao(X,Y):-
	homem(X),
	(pai(Z,X)),/*;mae(Z,X)),*/
	(filho(Y,Z);filha(Y,Z)),Y\==X.

irma(X,Y):-
	mulher(X),
	(pai(Z,X)),/*;mae(Z,X)),*/
	(filho(Y,Z);filha(Y,Z)),Y\==X.

/* Regra Tios */
tio(X,Y):-
	(irmao(X,Z);(casados(X,W),irma(W,Z))),
	(filho(Y,Z);filha(Y,Z)).

tia(X,Y):-
		(irma(X,Z);(casados(W,X),irmao(W,Z))),
		(filho(Y,Z);filha(Y,Z)).

/* Regra Sobrinhos */
sobrinho(X,Y):-
	homem(X),
	(tio(Y,X);tia(Y,X)).

sobrinha(X,Y):-
		mulher(X),
		(tio(Y,X);tia(Y,X)).

/* Regra Primos */
primo(X,Y):-
	homem(X),
	((pai(Z,X),irmao(Z,W));(mae(Z,X),irma(Z,W))),
	(filho(Y,W);filha(Y,W)).

prima(X,Y):-
		mulher(X),
		((pai(Z,X),irmao(Z,W));(mae(Z,X),irma(Z,W))),
		(filho(Y,W);filha(Y,W)).

/* Regra Cunhados */
cunhado(X,Y):-
	homem(X),
	casados(X,Z),irma(Z,Y);
	(irmao(X,Z),(casados(Z,Y);casados(Y,Z))).

cunhada(X,Y):-
		mulher(X),
		casados(Z,X),irmao(Z,Y);
		(irmao(X,Z),(casados(Z,Y);casados(Y,Z))).

/* Exercício 3 - Ascendentes/Descendentes */
ascendente(X,Y) :- (filho(X,Y);filha(X,Y)).
ascendente(X,Y):-
	(filho(X,Z);filha(X,Z)),
	ascendentes(Z,Y).

descendente(X,Y):- ascendente(Y,X).

/* Outra Possibilidade */
ascendente_v2(X,Y):-
	pai(X,Y);mae(X,Y).
ascendente_v2(X,Y):-
	(pai(X,Z);mae(X,Z)),
	ascendente_v2(Z,Y).

descentente_v2(X,Y):- ascendente_v2(Y,X).
