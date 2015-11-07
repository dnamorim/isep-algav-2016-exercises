/**
*	@file algav_pl2-ex3.pl
*	@brief ALGAV PL2: Torres de Hanói
*
*	@author Duarte Nuno Amorim (1130674@isep.ipp.pt)
* @date Oct 1, 2015
*	@bug None.
*/

hanoi(1,A,B,_,Ii,Io):-
  write(Ii),
  write(": "),
  write("Move o disco de "),
  write(A),
  write(" para "),
  write(B),
  nl,
  Io is Ii+1.

hanoi(N,A,B,C,I,I3):-
  N1 is N-1,
  hanoi(N1,A,C,B,I,I1),
  hanoi(1,A,B,_,I1,I2),
  hanoi(N1,C,B,A,I2,I3).
