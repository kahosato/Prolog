node(t).
node(p).
node(n).
node(m).
node(b).
node(g).
edge(t, p).
edge(p, m).
edge(m, n).
edge(n, t).
edge(b, g).
connected_parts(Connected) :- findall([X], node(X), Xs), c_p(Xs, Connected).
c_p(Connected, Connected) :-
    \+(member(C1, Connected),
    member(C2, Connected),
    C1 \= C2,
    connected_c(C1, C2)).    
c_p(So_far, Connected) :-
    member(C1, So_far),
    member(C2, So_far),
    C1 \= C2,
    connected_c(C1, C2),
    rm(C1, So_far, S1),
    rm(C2, S1, S2),
    merge(C1, C2, New_c),
    c_p([New_c|S2], Connected).
connected_n(E, [H|T]) :- edge(E, H) ; edge(H, E) ; connected(E, T).
connected_c([X], Y) :- connected(X, Y).
connected_c([H|T], Y) :- connected(H, Y) ; connected_c(T, Y).
merge(X, [], X).
merge([], Y, Y).
merge([H|T], [H2|T2], [H|T3]) :- H =< H2,!, merge(T, [H2|T2], T3).
merge([H|T], [H2|T2], [H|T3]) :- merge([H|T], T2, T3).
