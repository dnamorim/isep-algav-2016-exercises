/**
*	@file algav_pl2-ex4.pl
*	@brief ALGAV PL4: Determinar se um dado Número é Primo
*
*	@author Duarte Nuno Amorim (1130674@isep.ipp.pt)
* @date Oct 14, 2015
*	@bug None.
*/

primo(2).
primo(3).
primo(N):-
  N > 3,
  (N mod 2 =\= 0), % =\=: diferente
  \+ divisivel(N,3). % \+ not

divisivel(N,D):-
  N mod D =:= 0. % =:= igual

divisivel(N,D):-
  D*D < N,
  D2 is D+1,
  divisivel(N,D2).
