%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                  %
%         276 Introduction to Prolog               %
%                                                  %
%         Coursework 2013-14 (crossings)           %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% ------------  (utilities) DO NOT EDIT

fees(2,3).   


forall(P,Q) :- \+ (P, \+ Q).


app_remove(X,List,Remainder) :-
  append(Front, [X|Back], List),
  append(Front, Back, Remainder).


% The following might be useful for testing.
% You may edit it if you want to adjust
% the layout. DO NOT USE it in your submitted code.

write_list(List) :-
  forall(member(X, List),
         (write('  '), write(X), nl)
        ).


% solutions for testing 

solution([f(g),f,f(w),f(g),f(c),f,f(b),f,f(g)]).
solution([f(g),f,f(c),f(g),f(w),f,f(b),f,f(g)]).
solution([f(g),f,f(b),f,f(w),f(g),f(c),f,f(g)]).
solution([f(g),f,f(b),f,f(c),f(g),f(w),f,f(g)]).


%% --------- END (utilities)



%% ------ Add your code to this file here.

%% ------ step 1.
in_farm(X) :- member(X, [f, w, g, c, b]).
all_in_farm([]).
all_in_farm([X|L]):- in_farm(X), all_in_farm(L).
safe([f|X]) :- all_in_farm(X).
safe([w, c]).
safe([w, b]).
safe([w, c, b]).
safe([g, b]).
safe([X]) :- in_farm(X).
%% ------ step 2.
safe_state(N-S) :- safe(N), safe(S).
%% ------ step 3.
include([], L2).
include([X|L], L2) :- member(X, L2), include(L, L2).
same_bank(B1, B2) :-
    all_in_farm(B1),
    all_in_farm(B2),
    length(B1, X), 
    length(B2, X), 
    include(B1, B2).
equiv(N1-S1, N2-S2) :-
    same_bank(N1, N2),
    same_bank(S1, S2).


%% ------ step 4.
/*  Remove the following comments if you wish to skip Step 6 */
safe_state(North-South) :- safe(North), safe(South).

/* 

remove(X,List,Remainder) :-
  app_remove(X,List,Remainder).

*/



