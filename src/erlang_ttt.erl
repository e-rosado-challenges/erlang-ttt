-module(erlang_ttt).
-export([run/0]).

run() ->
  game:initialize_game(io_handler).