/*

    MAC, MCSs, MRes - 
    Module 531: Laboratory (Prolog)

    Comp 2: 276 Introduction to Prolog

    File: family.pl - cjh

*/

child_of( emmeline, frank ). 
child_of( amelia, frank ).
child_of( harold, frank ).
child_of( chris, amelia ).
child_of( chris, john ).
child_of( emlyn, chris ).
child_of( emlyn, elizabeth ).
child_of( brendon, chris ).
child_of( brendon, elizabeth ). 
child_of( irene, maurice ).
child_of( les, maurice ).
child_of( elizabeth, irene ).
child_of( elizabeth, george ).
child_of( margaret, irene ).
child_of( margaret, george ).
child_of( rebecca, margaret ).
child_of( louise, margaret ).   
child_of( nick, margaret ).
child_of( rebecca, peter ).
child_of( louise, peter ).
child_of( nick, peter ).

male( frank ).   
male( harold ).
male( chris ).
male( john ).
male( emlyn ).
male( brendon ).
male( maurice ).
male( les ).
male( nick ).
male( peter ).
male( george ).

female( emmeline ).
female( amelia ).
female( elizabeth ).
female( irene ).
female( margaret ).
female( rebecca ).
female( louise ).

mother_of(M, C):-
    female(M),
    child_of(C, M).

grandparent_of(GP, C):-
    child_of(C, P),
    child_of(P, GP).

daughter_of(D, P):-
    child_of(D, P),
    female(D).

sibling_of(X, Y):-
    child_of(X, F),
    child_of(Y, F),
    X \= Y.

uncle_of(U, N):-
    sibling_of(U, P),
    child_of(P, N),
    male(U).

ancestor_of(Anc, X):-
    child_of(X, Anc).

ancestor_of(Anc, X):-
    child_of(X, P),
    ancestor_of(Anc, P).

% end of data
