%for a given value N, generate the list of all permutations with
% elements N, N+1, .., 2*N-1, with the property that the absolute value
% between 2 consecutive values from the permutation is <=2.
%cand(N,N).
cand(N,I):-
    L is 2*N-1,
    candidate(N,L,I).


%candidate(n)= candidate(n+1), n<=2n-1
%              n, otw

candidate(N,_,N).
candidate(N,L,I):-
    N =< L,
    N1 is N+1,
    candidate(N1,L,I).

permutations(N,V,L):-
    cand(N,I),
    permutations_aux(N,V,L,1,[I]).

permutations_aux(N,_,Col,N,Col):-!.
permutations_aux(N,V,L,Lg,[H|T]):-
    cand(N,I),
    abs(H-I)>=V,
    \+member(I,[H|T]),
    Lg1 is Lg+1,
    permutations_aux(N,V,L,Lg1,[I,H|T]).
