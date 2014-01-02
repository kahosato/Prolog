all_members([], _).
all_members([X|Y], Z):-
    member(X, Z), all_members(Y, Z).

# normal recursion
p2([], []).
p2([H|T], Y):-
    F is H-1,
    S is H+1,
    p2(T, NY),
    append([F,S], NY, Y).

# tail recursive
pairs(X, Y) :- p(X, [], Y).
p([], A, A).
p([H|T], A, Y):-
    F is H-1,
    S is H+1,
    append(A, [(F,S)], NA),
    p(T, NA, Y).

arbpairs(X, Y) :- ap(X, [], Y).
ap([], A, A).
ap([H|T], A, Y):-
    ap(T, [(H, H)|A], Y);
    S is 2*H,
    ap(T, [(H, S)|A], Y).
