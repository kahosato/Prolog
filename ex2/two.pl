plus(X, 0, X).
plus(X, s(Y), Z):-
    plus(s(X), Y, Z).

odd(s(0)).
odd(s(s(X))):- odd(X).

ones_zeros([]).
ones_zeros([1|X]) :- ones_zeros(X).
ones_zeros([0|X]) :- ones_zeros(X).

hasdups([X|Y]) :- member(X, Y).
hasdups([X|Y]) :- hasdups(Y).

least(X, Y, X) :- X < Y, !.
least(X, Y, Y) :- X >= Y, !.

prod(L, P):- prodh(L, A, P).
prodh([], A, A).
prodh([X|Y], A, P):-
    Acc is A * Y,
    prodh(Y, Acc, P).

contains(L1, L2, N):-
    length(L1, X),
    length(L2, Y),
    append(F, L2, S),
    append(S, A, L1).
    length(F, M),
    length(A, L),
    M is N-1,
    L is X-Y-N+1,
