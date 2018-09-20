-module(erlang_ttt).
-export([run/0]).

run() ->
  io_handler:clear(),
  io_handler:print_greeting(),
  game:initialize_game(io_handler).