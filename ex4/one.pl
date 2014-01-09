forall(P,Q) :- \+ (P, \+ Q).
write_list(List) :-
  forall(member(X, List),
         (write('  '), write(X), nl)
        ).

safe([f|X]), !.
safe(X) :- 
    \+ (member(c, X), member(g, X)),
    \+ (member(g, X), member(w, X)).
