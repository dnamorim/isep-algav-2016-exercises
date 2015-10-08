/**
*	@file algav_pl2-ex2.pl
*	@brief ALGAV PL2: Grafo
*
*	@author Duarte Nuno Amorim (1130674@isep.ipp.pt)
* @date Oct 1, 2015
*	@bug None.
*/

/* Graph */
liga(a,b).
liga(a,c).
liga(a,d).
liga(b,e).
liga(b,f).
liga(c,f).
liga(c,g).
liga(d,g).
liga(d,h).
liga(d,i).
liga(e,j).
liga(f,j).
liga(f,k).
liga(g,f).
liga(g,o).
liga(h,l).
liga(i,l).
liga(j,m).
liga(j,n).
liga(k,n).
liga(k,p).
liga(l,p).

caminho(A,A):- write(A).

caminho(A,B):-
  liga(C,B),
  caminho(A,C),
  write("->"),write(B).
