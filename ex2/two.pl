plus(X, 0, X).
plus(X, s(Y), Z):-
    plus(s(X), Y, Z).

odd(s(0)).
odd(s(s(X))):- odd(X).

ones_zeros([]).
ones_zeros([1|X]) :- ones_zeros(X).
ones_zeros([0|X]) :- ones_zeros(X).

hasdups([X|Y]) :- member(X, Y).

least(X, Y, X) :- X < Y, !.
least(X, Y, Y) :- X >= Y, !.



