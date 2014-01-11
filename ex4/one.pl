forall(P,Q) :-
    \+ (P, \+ Q).
write_list(List) :-
     forall(member(X, List),
         (write('  '), write(X), nl)
        ).
nodup([]).
nodup([H|Y]) :-
    \+ member(H, Y),
    nodup(Y).
bank([f|L]) :-
    nodup(L),
    forall(member(X, L), member(X, [g, c, b, w])).
bank(L) :-
    \+ member(f, L),
    nodup(L),
    forall(member(X, L), member(X, [g, c, b, w, f])).

safe([f|X]) :-
    bank(X).
safe([X|Y]) :-
    bank([X|Y]),!,
    X == f ;
    \+ member(f, X),
    \+ (member(c, X), member(g, X)),
    \+ (member(g, X), member(w, X)).

safe_state(N-S) :-
    safe(N),
    safe(S).

equiv(N1-S1, N2-S2) :-
    bank(N1),
    bank(S1),
    bank(N2),
    bank(S2),!,
    sort(N1, N),
    sort(N2, N),
    sort(S1, S),
    sort(S2, S).

goal([]-[f|X]) :-
    sort(X, [b, c, g, w]).

visited(N1-S1, History) :-
    sort(N1, N),
    sort(S1, S),!,
    member(N2-S2, History),
    sort(N2, N),
    sort(S2, S).

remove(X, List, Remainder) :- member(X, List), rm(X, List, [], Remainder).
rm(X, [X|T], A, R) :-
    append(A, T, R).
rm(X, [H|T], [H|A], R) :-
    rm(X, T, A, R).

