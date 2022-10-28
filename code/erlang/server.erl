%% Example taken from Joe Armstrong's blog
%% https://joearms.github.io/published/2013-11-21-My-favorite-erlang-program.html
-module(server).
-export([test/1]).

universal_server() ->
    receive
        {become, F} ->
            F()
    end.

factorial_server() ->
    receive
        {From, N} ->
            From ! factorial(N),
            factorial_server()
    end.

factorial(0) -> 1;
factorial(N) -> N * factorial(N-1).

test(N) ->
    Pid = spawn(fun universal_server/0),
    io:format("Universal server PID=~p~n", [Pid]),
    Pid ! {become, fun factorial_server/0},
    Pid ! {self(), N},
    receive
        X -> X
    end.
