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
em([_|T], o, A, Y) :- em(T, e, A, Y).
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

app([], X, X).
app([A|B], X, [A|Z]) :- app(B, X, Z).

rev(X, Y) :- rev_h(X, [], Y).
rev_h([], A, A).
rev_h([H|T], A, Y):-
    append([H], A, NA),
    rev_h(T, NA, Y).

average(L, A) :- avg(L, 0, 0, A).
avg([], A, N, Avg) :- Avg is A / N.
avg([H|T], A, N, Avg):-
    NA is H+A,
    NN is N + 1,
    avg(T, NA, NN, Avg).
% Assume list is list of natural number.
max_and_avg(L, M, A) :- m_a_a(L, 0, M, 0, 0, A).
m_a_a([], AM, AM, N, S, A) :- A is S/N.
m_a_a([H|T], Acc_max, Max, Num, Sum, Avg):-
    bigger(H, Acc_max, New_max),
    New_num is Num + 1,
    New_sum is Sum + H,
    m_a_a(T, New_max, Max, New_num, New_sum, Avg).

bigger(X, Y, X) :- 
    X >= Y, !.
bigger(X, Y, Y) :-
    X < Y, !. 

oldest_people(L, Oldest) :- o_p(L, 0, [], Oldest).
o_p([], _, Oldest, Oldest).
o_p([(P, A, _)|T], Age, [P], Oldest):-
    A > Age
    ->
    o_p(T, A, [P], Oldest)
    ;
    A == Age
    ->
    o_p(T, A, [P|AO], Oldest)
    ;
    o_p(T, Age, AO, Oldest).

split_sex(People, Male, Female) :-
    s_s(People, [], Male, [], Female).
s_s([], AM, AM, AF, AF).
s_s([(P, male, _)|T], [P|AM], Male, AF, Female) :-
    s_s(T, AM, Male, AF, Female).
s_s([(P, female, _)|T], AM, Male, AF, Female) :-
    s_s(T, AM, Male, [P|AF], Female).

nodup(X, Y) :- nodup(X, [], Y).
nodup([], A, A).
nodup([X|T], A, Y) :- \+ member(X, A), !, nodup(T, [X|A], Y).
nodup([_|T], A, Y) :- nodup(T, A, Y).

quick_sort(List, Sorted) :- q_sort(List, [], Sorted).
q_sort([], Acc, Acc).
q_sort([H|T], Acc, Sorted) :- 
    pivoting(H, T, L2, L1),
    q_sort(L1, Acc, Sorted1), q_sort(L2, [H|Sorted1], Sorted).

pivoting(_, [], [], []).
pivoting(H, [X|Y], [X|A1], A2) :- X =< H,!, pivoting(H, Y, A1, A2).
pivoting(H, [X|Y], A1, [X|A2]) :- pivoting(H, Y, A1, A2).
