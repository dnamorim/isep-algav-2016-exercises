/**
*	@file algav_exercicioPratico1-3df.pl
*	@brief ALGAV PL3
*
*	@author Duarte Nuno Amorim (1130674@isep.ipp.pt)
* @date Oct 14, 2015
*	@bug None.
*/

%pais(nome,dataFormacao)
pais(portugal,1093).
pais(franca,843).
pais(espanha,1469).

%cidade(nome,pais,populacao)
cidade(porto,portugal,207591).
cidade(aveiro,portugal,185675).
cidade(lisboa,portugal,547733).
cidade(madrid,espanha,3232463).
cidade(burgos,espanha,174075).
cidade(barcelona,espanha,1595110).
cidade(paris,franca,2211297).
cidade(marselha,franca,852395).
cidade(lyon,franca,472330).

/* -- TESTE 3DB -- */
/* Mostrar pares de Cidades de Paises Diferentes que possam ser germinados
  (Dif. População < 50000 */
paresCidadesGerminaveis:-
  cidade(CID1, PAI1, POP1),
  cidade(CID2, PAI2, POP2),
  PAI1 \== PAI2,
  DIF is abs(POP1 - POP2),
  DIF < 50000,
  %DIF > 0,
  write(CID1),write(','),write(CID2),nl,
  fail;
  true.

/* Verificar se 2 cidades são germináveis */
cidadesGerminaveis(C1,C2):-
  cidade(C1,PAI1,POP1),
  cidade(C2,PAI2,POP2),
  PAI1 \== PAI2,
  DIF is abs(POP1 - POP2),
  DIF < 50000.

/* -- TESTE 3DF -- */
/* Mostrar Cidades Similares */
mostraCidadesSimilares(VDIF):-
  cidade(CID1, PAI1, POP1),
  cidade(CID2, PAI2, POP2),
  PAI1 == PAI2,
  CID1 \== CID2,
  DIF1 is abs(VDIF - POP1),
  DIF2 is abs(VDIF - POP2),
  DIF1 < 50000,
  DIF2 < 50000,
  write(PAI1),tab(2),
  write(CID1),write(','),write(POP1),tab(3),
  write(CID2),write(','),write(POP2),nl,
  fail.

/* Verificar se a Data de Formação de uma Cidade com população superior a 500000
  está entre dois valores */
cidadeTamanhoIdade(CID, POP):-
  cidade(CID, PAI, POP),
  POP > 500000,
  pais(PAI, FORM),
  MIN is abs(2015 - 800),
  MAX is abs(2015 - 200),
  FORM >= MIN,
  FORM =< MAX.
