fact(N, R) :- factorial(N, 1, R).
factorial(0, Acc, R) :- R is Acc.
factorial(N, Acc, R) :-
    N > 0,
    Acc1 is Acc * N,
    N1 is N - 1,
    factorial(N1,Acc1, R).
    
reverse([], []). 
reverse([Head|Tail], List) :- reverse(Tail, Rtail),
    append(Rtail, [Head], List).

smallest([Item], Item).
smallest([Head|Tail], Item) :- 
    smallest(Tail, SmallTail),
    (Head =< SmallTail -> Item is Head
     ; Item is SmallTail).
     
mysort([Item], [Item]).
mysort(Unsorted, Sorted) :- 
    smallest(Unsorted, Small),
    select(Small, Unsorted, Trimmed),
    !,
    mysort(Trimmed, Tail),
    append([Small], Tail, Sorted).
    
mysortdesc(Unsorted, Sorted) :- mysort(Unsorted, Revsort), reverse(Revsort, Sorted).