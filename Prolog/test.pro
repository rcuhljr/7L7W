can_work(john, 1).
can_work(john, 2).
can_work(john, 3).
can_work(john, 4).
can_work(bob, 2).
can_work(bob, 3).
can_work(bob, 5).
can_work(ed, 4).
can_work(ed, 5).
can_work(ed, 1).


works(X,Y,Z, Workers) :- can_work(X,Y), can_work(X,Z), member(X, Workers) .

valid_day(X,Y,Z) :- X \= Y, works(X,Z), works(Y,Z).

