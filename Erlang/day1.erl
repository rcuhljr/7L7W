-module(day1).
-export([my_fact/1]).
-export([my_fib/1]).
-export([words/1]).
-export([count_to/1]).
-export([match_test/1]).
-include_lib("eunit/include/eunit.hrl").

my_fact(0) -> 1;
my_fact(N) -> N * my_fact(N-1).

my_fib(0) -> 1;
my_fib(1) -> 1;
my_fib(N) -> my_fib(1,1,N-1).

my_fib(N, PREV, 1) -> N+PREV;
my_fib(N, PREV, X) -> my_fib(N+PREV, N, X-1).

words([N]) when N == 32 -> 0;
words([N]) when N /= 32 -> 1;  

words([Head, N | Tail]) when Head /= 32, N == 32 -> count_words(Head, [N | Tail], 1);  
words([Head, N | Tail]) -> count_words(Head, [N | Tail], 0).

count_words(_, [] , Count) -> Count;
count_words(Char, [Head | Tail], Count) when 32 == Char, 32 /= Head -> count_words(Head, Tail, Count + 1);
count_words(_, [Head | Tail], Count) -> count_words(Head, Tail, Count).
  
count_to(N) -> count_to(1, N-1).

count_to(N, 0) -> erlang:display(N), ok;
count_to(N, T) -> erlang:display(N), count_to(N+1, T-1).

match_test(success) -> "Success";
match_test({error, Message}) -> "error: " ++ Message.

words_one_blank_test() -> 0 = words(" ").
words_one_letter_test() -> 1 = words("A").
words_two_blank_test() -> 0 = words("  ").
words_one_letter_one_blank_test() -> 1 = words("A ").
words_one_blank_one_letter_test() -> 1 = words(" A").
leading_space_test() -> 4 = words(" A big word here").
ending_space_test() -> 4 = words("A big word here ").
ending_letter_test() -> 5 = words("A big word here I").