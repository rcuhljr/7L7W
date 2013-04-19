-module(day1).
-export([mirror/1]).
-export([number/1]).
-export([my_fact/1]).
-export([my_fib/1]).


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