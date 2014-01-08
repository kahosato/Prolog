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

connected_parts(Connected) :-
    findall([X], node(X), Xs), 
    c_p(Xs, Connected).

c_p(Connected, Connected) :-
    \+ find_connected_pair(_, _, Connected).

c_p(So_far, Connected) :-
    find_connected_pair(C1, C2, So_far),
    rm(C1, So_far, S1),
    rm(C2, S1, S2),
    merge(C1, C2, New_c),
    c_p([New_c|S2], Connected).

find_connected_pair(C1, C2, So_far) :-
    member(C1, So_far),
    member(C2, So_far),
    C1 \= C2,
    connected_c(C1, C2).

% function that removes element S on its first occurence.
rm(S, L1, L2) :- rm(S, L1, [], L2).
rm(_, [], L2, L2).
rm(S, [S|T1], A, L2) :- append(A, T1, L2).
rm(S, [H|T1], A, L2) :- rm(S, T1, [H|A], L2).

% First argument: node, second argument: component.
connected_n(N, [H|T]) :- 
    edge(N, H) ;
    edge(H, N) ;
    connected_n(N, T).

% first argument: component, second argument: component.
connected_c([X], Y) :-
    connected_n(X, Y).
connected_c([H|T], Y) :-
    connected_n(H, Y) ;
    connected_c(T, Y).

merge(X, [], X).
merge([], Y, Y).
merge([H|T], [H2|T2], [H|T3]) :- H =< H2,!, merge(T, [H2|T2], T3).
merge([H|T], [H2|T2], [H2|T3]) :- merge([H|T], T2, T3).
