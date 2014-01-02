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
    append(F, L2, S),
    append(S, A, L1),
    length(F, X),
    N is X + 1.

add_poly([], Y, Acc, P):- append(Acc, Y, P).
add_poly(X, [], Acc, P):- append(Acc, X, P).
add_poly([(A, B)|X], [(C, D)|Y], Acc, P) :-
    B == D,
    E is A + C,
    append(Acc, [(E, B)], NewAcc),
    add_poly(X, Y, NewAcc, P);
    B > D,
    append(Acc, [(A,B)], NewAcc),
    add_poly(X, [(C, D)|Y], NewAcc, P);
    B < D,
    append(Acc, [(C,D)], NewAcc),
    add_poly([(A,B)|X], Y, NewAcc, P).


