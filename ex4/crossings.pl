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


/*  Remove the following comments if you wish to skip Step 6 */

/* 

remove(X,List,Remainder) :-
  app_remove(X,List,Remainder).

*/



