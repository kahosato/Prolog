all_bs([]).
all_bs([b|T]) :- all_bs(T).
app([], Z, Z).
app([U|X], Y, [U|Z]):- app(X, Y, Z).
rev([], []).
rev([U|X], R) :- rev(X,Y),
                 append(Y, U, R).
las([U|[]], U).
las([U|X], Y) :- las(X, Y).

mem(X, [X|Tail]).
mem(X, [Y|Tail]):- mem(X, Tail).

sum(Ns, T) :- tr_sum(Ns, 0, T).

tr_sum([], Total, Total).
tr_sum([N|Ns], S, Total) :-
    Sub is N + S,
    tr_sum(Ns, Sub, Total).

dragon(puff).
dragon(macy).
dragon(timothy).
magic(puff).
vegetarian(macy).
lives_forever(X):-magic(X).
lives_forever(X) :- vegetarian(X).

person(bob).
person(chris).
person(frank).
likes(bob, frank).
sad(X):-
    person(X),
    \+ (person(Y),
        X\=Y,
    likes(X, Y)
    ).

sad(kaho).
happy(X):-
    \+(friend(X,Y) \+likes(Y, logic))

least(X, Y, X) :- X < Y, !.
least(X, Y, Y) :- X > Y.

len([], 0).
len([X|Y], L) :-
    len(Y, R), 
    L is R + 1.
