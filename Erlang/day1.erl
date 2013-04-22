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

words([N]) -> 
  if
    N == 32 -> 0;
    true -> 1
  end;

words([Head, N | Tail]) ->   
  if
    Head /= 32, N /= 32 -> count_words(Head, [N | Tail], 0);
    Head /= 32, N == 32 -> count_words(Head, [N | Tail], 1);
    true -> count_words(Head, [N | Tail], 0)
  end.


count_words(Char, [] , Count) -> Count;
count_words(Char, [Head | Tail], Count) ->   
  if       
    32 == Char, 32 /= Head -> count_words(Head, Tail, Count + 1);
    true -> count_words(Head, Tail, Count)
  end.  

count_to(N) -> count_to(1, N-1).

count_to(N, 0) -> erlang:display(N), ok;
count_to(N, T) -> erlang:display(N), count_to(N+1, T-1).

match_test(success) -> "Success";
match_test({error, Message}) -> "error: " ++ Message.