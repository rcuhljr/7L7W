-module(day1).
-export([mirror/1]).
-export([number/1]).
-export([my_fact/1]).
-export([my_fib/1]).
-export([words/1]).
-export([count_to/1]).
-export([match_test/1]).


mirror(Anything) -> Anything.

number(one) -> 1;
number(two) -> 2;
number(thre) -> 3.

my_fact(0) -> 1;
my_fact(N) -> N * my_fact(N-1).


my_fib(0) -> 1;
my_fib(1) -> 1;
my_fib(N) -> my_fib(1,1,N-1).

my_fib(N, PREV, 1) -> N+PREV;
my_fib(N, PREV, X) -> my_fib(N+PREV, N, X-1).

words(N) when length(N) == 2 ->   
  if
    N == [32,32] -> 0;
    true -> 1
  end;

words(N) when length(N) == 1 -> 
  if
    N == [32] -> 0;
    true -> 1
  end;

words(N) -> 
  begin
  [Head | Tail] = N,
  if
    Head /= 32 -> count_words(Head, Tail, 1);
    true -> count_words(Head, Tail, 0)
  end  
end.

count_words(Char, Seq, Count) when length(Seq) < 2 -> Count;
count_words(Char, Seq, Count) -> 
  begin
    [Head | Tail] = Seq,
    if 
      32 /= Char, 32 == Head -> count_words(Head, Tail, Count + 1);
      true -> count_words(Head, Tail, Count)
    end
  end.

count_to(N) -> count_to(1, N-1).

count_to(N, 0) -> erlang:display(N), ok;
count_to(N, T) -> erlang:display(N), count_to(N+1, T-1).

match_test(success) -> "Success";
match_test({error, Message}) -> "error: " ++ Message.