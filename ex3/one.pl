all_members([], _).
all_members([X|Y], Z):-
    member(X, Z), all_members(Y, Z).

% normal recursion
p2([], []).
p2([H|T], Y):-
    F is H-1,
    S is H+1,
    p2(T, NY),
    append([F,S], NY, Y).

% tail recursive
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
    append(A, [(H, H)], NA),
    ap(T, NA, Y);
    S is 2*H,
    append(A, [(H,S)], NA),
    ap(T, NA, Y).

replace_wrap(X, Y) :- rw(X, [], Y).
rw([], A, A).
rw([H|T], A, Y):-
    append(A, [wrap(H)], NA),
    rw(T, NA, Y).

rw2(X, Y) :- findall(wrap(A), member(A, X), Y).

even_members(X, Y) :- em(X, o, [], Y)
em([], _, A, A).
em([H|T], o, A, Y) :- em(T, e, A, Y).
em([H|T], e, A, Y) :- append(A, [H], NA), em(T, o, NA, Y ).

numval(A, A):-number(A).
numval(a(X, Y), V) :-
    numval(X, V1), 
    numval(Y, V2),
    V is V1 +V2.
numval(m(X, Y), V) :-
    numval(X, V1),
    numval(Y, V2),
    V is V1 * V2.

app(X, Y, [X|Y]).
    
