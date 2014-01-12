%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                         %
%         276 Introduction to Prolog                      %
%                                                         %
%         Practice Lexis Test                             %
%                                                         %
%         Question 1 (prison)                             %
%                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                         %
%         Question 1 (prison)                             %
%                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% compile the Prison Database

:- ensure_loaded(prisonDB_lexis).



cell(N) :-
   cells(Cells),
   in_range(1,Cells,N).




/*  Remove the following comments if you wish to skip part(a) */

/* 

% load the library(between) module

:- use_module(library(between)).

in_range(Min, Max, N) :- between(Min, Max, N).

*/

%% ------ Add your code to this file here.

