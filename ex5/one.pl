under_attack(q(M1, N1), q(M2, N2)):-
  N1 == N2;
  D1 is  M1 - N1, 
  D2 is  M2 - N2,
  D1 == D2;
  S1 is M1 + N1,
  S2 is M2 + N2,
  S1 == S2.

on_board(q(_, H)) :-
  member(H, [1, 2, 3, 4, 5, 6, 7, 8]).

no_attack(L, Q):-
  on_board(Q),
  no_attack_h(L, Q).

no_attack_h([], _).
no_attack_h([Q1|T], Q2) :- 
  \+ under_attack(Q1, Q2), 
  no_attack(T, Q2).

n_a_test([q(7, 4), q(8, 1)], q(6, 2)).
template([q(1, _), q(2, _), q(3, _), q(4, _), q(5, _), q(6, _), q(7, _), q(8, _)]).

queen8(Sol) :- q8_h(Sol, []).
q8_h([], _).
q8_h([Q1|T], Qs) :-
  no_attack(Qs, Q1),
  q8_h(T, [Q1|Qs]).

  
