plus(0, Y, Y).
plus(s(X), Y, Z) :- plus(X, s(Y), Z).
odd(s(0)).
odd(s(s(X))):-odd(X).
ones_zeros([]).
ones_zeros([1|X]) :- ones_zeros(X).
ones_zeros([0|X]) :- ones_zeros(X).
has_dups(L) :- dups(X, L).
dups(X, [X|L]) :- member(X, L).
dups(X, [Y|L]) :- dups(X, L).

mem(X, [X|L]).
mem(X, [Y|L]) :- mem(X, L).

p(L, P) :- prod(L, 1, P).
prod([], P, P).
prod([X|Y], N, P) :-
    NX is (N*X),
    prod(Y, NX, P).
