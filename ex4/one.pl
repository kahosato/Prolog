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

safe([f|_]).
safe(X) :-
    \+ member(f, X),
    \+ (member(c, X), member(g, X)),
    \+ (member(g, X), member(w, X)).

safe_state(N-S) :-
    safe(N),
    safe(S).

perm(A, B) :- sort(A, X), sort(B, X).

equiv(N1-S1, N2-S2) :-
  perm(N1, N2),
  perm(S1, S2).
goal(State) :-
  equiv([]-[f, w, g, b, c], State).

visited(State, [S|H]) :- equiv(State, S), !; visited(State, H).

remove(X, [X|T], T).
remove(X, [H|T], [H|R]) :-
    remove(X, T, R).

crossing([f|N1]-S1 , Move, N2-[f|S2]) :- 
  remove(X, N1, N2), S2 = [X|S1], Move = f(X);
  N1 = N2,
  S1 = S2, 
  Move = f. 

crossing(N1-[f|S1], Move, [f|N2]-S2) :-
  remove(X, S1, S2), N2 = [X|N1], Move = f(X);
  N1 = N2,
  S1 = S2,
  Move = f. 

succeeds(Seq) :-
  journey([f, w, g, c, b]-[], [], [], Seq).

journey(State, H, A, A) :-
  goal(State), \+length(H, 0).

journey(State, History, A, Seq) :-
  safe_state(State),
  \+ visited(State, History),
  crossing(State, Move, NewState),
  journey(NewState, [State|History], [Move|A], Seq).
fees(f, 2).
fees(f(_), 3).
journey_cost(Seq, Cost):-
  succeeds(Seq),
  calculate(Seq, 0, Cost).
calculate([], A, A).
calculate([M|T], A, C):-
  fees(M, F),
  NewA is A + F,
  calculate(T, NewA, C).
