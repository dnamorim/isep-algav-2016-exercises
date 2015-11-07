/**
*	@file algav_pl2-ex1.pl
*	@brief ALGAV PL2: Instruções Recursivas
*
*	@author Duarte Nuno Amorim (1130674@isep.ipp.pt)
* @date Oct 1, 2015
*	@bug None.
*/

/* a): Potência Inteira Não Negativa */
potencia(_,0,1).

potencia(X,Y,R):-
  Y > 0,
  Y1 is Y-1,
  potencia(X,Y1,R1),
  R is X*R1.

/* b): Factorial */
factorial(0,1).

factorial(X,R):-
  X > 0,
  X1 is X-1,
  factorial(X1,R1),
  R is X*R1.

/* c): Divisão Inteira */
divisao(X,Y,0):-
  Y > 0, X < Y.

divisao(X,Y,R):-
  X >= Y,
  Y > 0,
  X1 is X-Y,
  divisao(X1,Y,R1),
  R is R1+1.

/* d): Resto Divisão Inteira */
resto(X,Y,X):-
  Y > 0,
  X < Y.

resto(X,Y,R):-
  X >= Y,
  Y > 0,
  X1 is X-Y,
  resto(X1,Y,R).
