?- use_module(library(clpfd)).

%Rules

%lte(Base, Val) :- Base #=< Val.
%gte(Base, Val) :- Base #>= Val.

%Row uses values 1 to 4
valid_section(Row) :-     
    length(Row, Len),
    numlist(1, Len, Domain),
    member(Item, Domain),
    Item =< Len,
    Item >= 1,
    is_set(Row).    
    %min_list(Row, 1),
    %max_list(Row, Len).
    

valid_game(Board) :-
    length(Board, Len),
    ( Len =:= (2^2)^2 -> true
     ;Len =:= (3^2)^2 -> true
     ;Len =:= (4^2)^2 -> true
     ;false).

check_board([I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16]) :-
    valid_section([I1,I2,I3,I4]),
    valid_section([I5,I6,I7,I8]),
    valid_section([I9,I10,I11,I12]),
    valid_section([I13,I15,I15,I16]),
    valid_section([I1,I5,I9,I13]),
    valid_section([I2,I6,I10,I14]),
    valid_section([I3,I7,I11,I15]),
    valid_section([I4,I8,I12,I16]),
    valid_section([I1,I2,I5,I6]),
    valid_section([I3,I4,I7,I8]),
    valid_section([I9,I10,I13,I15]),
    valid_section([I11,I12,I15,I16]).

    
    
%   length(Board, Len),
%   Size = sqrt(Len),
%   numlist(1, Size, Iters),
%    numlist(1, Size, Sample),
%    member(Item, Iters),
%    Offset = Item*Size,
    
%column uses values 1 to 4
%quadrant uses values 1 to 4

sudoku(Puzzle, Solution) :- 
    Solution = Puzzle,    
    Puzzle = [I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16],    
    check_board(Puzzle).
    
valid_queen((Row, Col)) :-
    Range = [1,2,3,4,5,6,7,8],
    member(Row, Range),
    member(Col, Range).
    
valid_board([]).
valid_board([Head|Tail]) :- valid_queen(Head), valid_board(Tail).

rows([], []).
rows([(Row, _)|QueensTail], [Row|RowsTail]) :-
    rows(QueensTail, RowsTail).

cols([], []).
cols([(_, Col)|QueensTail], [Col|ColsTail]) :-
    cols(QueensTail, ColsTail).    
    
diags1([], []).
diags1([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :-
    Diagonal is Col-Row,
    diags1(QueensTail, DiagonalsTail).    

diags2([], []).
diags2([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :-
    Diagonal is Col+Row,
    diags2(QueensTail, DiagonalsTail).
    
eight_queens([(R1,C1),(R2,C2),(R3,C3),(R4,C4),(R5,C5),(R6,C6),(R7,C7),(R8,C8)]) :- 
    List = [(R1,C1),(R2,C2),(R3,C3),(R4,C4),(R5,C5),(R6,C6),(R7,C7),(R8,C8)],
    RowVals = [R1,R2,R3,R4,R5,R6,R7,R8],
    ColVals = [C1,C2,C3,C4,C5,C6,C7,C8],
    RowVals ins 1..8,
    ColVals ins 1..8,
    all_different(RowVals),
    all_different(ColVals),
    length(List, 8),
    valid_board(List),
    
    rows(Board,Rows),
    cols(Board, Cols),
    diags1(Board, Diags1),
    diags2(Board, Diags2),
    
    all_different(Rows),
    all_different(Cols),
    all_different(Diags1),
    all_different(Diags2).
    