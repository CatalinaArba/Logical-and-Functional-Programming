%substitute(X-list,E-the element we want to substitute, S-the element,R-result list) 
% we substitute with)
% flow model(i,i,i,i)(i,i,i,o)
substitute([],_,_,[]).
substitute([H|T],E,S,[HR|Rez]):-
    H=:=E,HR is S,substitute(T,E,S,Rez).
substitute([H|T],E,S,[HR|Rez]):-
    H=\=E,HR is H,substitute(T,E,S,Rez).

%sublist(X-list,M-the lowe bound of the sublist, N-the upper bound of the sublist,R-result list/the sublist) 
% we substitute with)
% flow model(i,i,i,i)(i,i,i,o)
sublist([],_,_,[]).
sublist([H|T],M,N,[HR|Rez]):-
    M=<1,N>=1,MM is M-1, NN is N-1,HR is H,sublist(T,MM,NN,Rez).
sublist([_|T],M,N,Rez):-
    MM is M-1, NN is N-1,sublist(T,MM,NN,Rez).