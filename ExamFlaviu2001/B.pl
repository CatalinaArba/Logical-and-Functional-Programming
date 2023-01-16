% Given a numerical linear list, write a program that returns (in a list
% of pairs) all possible paortitions of the initial list in 2 sublists,
% such that all elements of the sublists are relatively prime numbers
% (all elements of the first sublists are relatively prime and all
% elements of the second list are relatively prime). The first sublist
% will contain at most the same number of elements as the second
% sublist.

%splitt(l1...ln, R1, R2)=[], n=0
%                splitt(l2..ln, R1 U l1, R2)
%                split(l2..ln, R1, R2 U l1).
splitt([],[],[]).
splitt([H|T], [H|L1], L2):-
    splitt(T,L1,L2).
splitt([H|T], L1, [H|L2]):-
    splitt(T,L1,L2).


%length(l1..ln, c)=c, n=0
%                  length(l2..ln, c+1),otw

length([],C,C).
length([_|T],C,R):-
    C1 is C+1,
    length(T,C1,R).


%gcd(a,b)=a, a=b or b=0
%         b, a =0
%         gcd(a-b,b), a>b
%         gcd(a, b-a), otw

%gcd(A:int, B:int, D:int)
%(i,i,o)
gcd(0,B,B):-!.
gcd(A,0,A):-!.
gcd(A,B,D):-
    A >= B,
    A1 is A-B,
    gcd(A1,B,D).
gcd(A,B,D):-
    A < B,
    B1 is B-A,
    gcd(A,B1,D).


%nrPrime(A,B)=true, gcd(A,B)=1
%             false, otw

nrPrime(A,B):-
    gcd(A,B,D),
    D =:= 1.

%check(l1...ln, e)=l1, n=1
%               check(l1...ln, l1)

%check([]).
%check([H|T]):-
%    check(T),
%    nrPrime(H,T).




%checkRelPrime(l1..ln)=T, n=0
%                      F, gcd(l1, l2)!=1
%                      checkPrime(l2...ln), otw
%

%D = gcd
checkRelPrime([],D,D).
checkRelPrime([H|T],D,R):-
    gcd(H,D,D1),
    checkRelPrime(T,D1,R).


head([H|_],H).

myPredicate(L1) :-
    length(L1,0,C1),
    C1=1.


myPredicate(L1) :-
    head(L1, H1),
    checkRelPrime(L1,H1, R1),
    R1 =:=1.



main(L,[L1|[L2]]):-
    splitt(L, L1, L2),
    %findall(L1,L2, splitt(L,L1,L2), R),
    myPredicate(L1),
    myPredicate(L2).


m(L,X):-
    findall(R,main(L,R),X).

