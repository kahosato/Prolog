plus(X, 0, X).
plus(X, s(Y), Z):-
    plus(s(X), Y, Z).

