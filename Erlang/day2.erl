-module (day2).
-export ([match_atom/2]).
-export ([tictactoe/1]).

match_atom(Items, Target) -> lists:last([ Blurb || {Name, Blurb} <- Items, Name == Target ]).

%day2:tictactoe([x,x,x,o,' ',o,o,' ',' ']).
tictactoe(Board) -> tictactoe(Board, is_cat(Board), is_won(x, Board), is_won(o, Board)).

tictactoe(Board, IsCat, XWon, OWon) when IsCat, not XWon, not OWon -> cat;

tictactoe(Board, IsCat, XWon, OWon) when XWon -> x;

tictactoe(Board, IsCat, XWon, OWon) when OWon -> o;

tictactoe(Board, IsCat, XWon, OWon) when not IsCat, not XWon, not OWon -> no_winner.

is_won(Target, [B1, B2, B3, B4, B5, B6, B7, B8, B9]) -> 
	lists:any(fun(X) -> lists:all(fun(Y) -> Target == Y end, X) end, [
		[B1,B2,B3],[B4,B5,B6],[B7,B8,B9],
		[B1,B4,B7],[B2,B5,B8],[B3,B6,B9],
		[B1,B5,B9],[B3,B5,B7]]).

is_cat(Board) -> not lists:any(fun(X) -> X ==' ' end, Board).	