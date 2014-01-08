no_of_parents(adam, N) :-
    !,
    N = 0.
no_of_parents(eva, N) :-
    !,
    N = 0.
no_of_parents(X, 2) :- person(X).

person(adam).
person(eva).
person(isaq).
