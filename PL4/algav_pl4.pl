/**
*	@file algav_pl4.pl
*	@brief ALGAV PL4 - Introdução às Listas
*
*	@author Duarte Nuno Amorim (1130674@isep.ipp.pt)
* @date Oct 15, 2015
*	@bug None.
*/

/* Exercício 1 */
membro(X,[X|_]).
membro(X,[_|L]):-
  membro(X,L).

/* Exercício 2 */
concatena([ ],L,L).
concatena([A|B],C,[A|D]):-
  concatena(B,C,D).



/* Exercício 3d) */
menor([X],X).
menor([X|R],M1):-
  menor(R,M1),
  M1 < X.
menor([X|_],X).
