/**
* @file algav_exercicioPratico1.pl
* @brief ALGAV - Exercício Prático 1
*
* @author Duarte Nuno Amorim (1130674@isep.ipp.pt)
* @date Oct 15, 2015
* @bug None.
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

/* 1. Produto é Componente Intermédio (entra na composição de outros produtos e
também é composto por outros produtos) */
componenteIntermedio(COD,NAM):-
  produto(COD,NAM),
  composicao(_,COD,_),
  composicao(COD,_,_).

/* 2. Predicado que mostra todos os componentes Intermédios utilizados de forma directa */
mostraComponenteIntermedio(COD):-
  produto(COD,NAM),
  write("--------"),nl,
  write(COD),write(', '),write(NAM),nl,
  write("--------"),nl,
  escreveComponentes(COD).

escreveComponentes(COD):-
  composicao(COD,COD1,QTD1),
  produto(COD1,NAM1),
  write(COD1),write(', '),write(NAM1),write(', '),write(QTD1),nl,
  fail;
  true.
