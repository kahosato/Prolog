arc(a, b).
arc(c, f).
arc(f, e).
arc(b, c).
arc(d, f).
arc(b, d).
arc(c, e).

path(X, Z):-
    arc(X, Z).

path(X, Z):-
    path(X, Y),
    path(Y, Z).







