
under_attack(q(M1, N1), q(M2, N2)) :-
  N1 == N2;
  D1 is M1 - N1,
  D2 is M2 - N2,
  D1 == D2;
  S1 is M1 + N1,
  S2 is M2 + N2,
  S1 == S2.

on_board(H) :- 
  member(H, [1, 2, 3, 4, 5, 6, 7, 8]).

% Check if q(V, H) would be safe in PartialSol.
no_attack(PartialSol, V, H) :- on_board(H), n_a_h(PartialSol, 1, V, H).
% helper for no_attack.
% n_a_h(P, I , V, H)
% P is the partial solution (list of horisontal position).
% I keeps track of the index of the head of P. (vertical position)
n_a_h([], _, _, _).
n_a_h([Q|T], I, V, H) :-
  \+ under_attack(q(I, Q), q(V, H)),
  NewI is I + 1,
  n_a_h(T, NewI, V, H).

queen8(Sol) :- q8_h(Sol, [], 1).
q8_h([], _, 9).
% q8_h(Sol, A, )
q8_h([Q|T], Qs, I) :-
  no_attack(Qs, I, Q),
  NewI is I + 1,
  append(Qs, [Q], NQs),
  q8_h(T, NQs, NewI).
