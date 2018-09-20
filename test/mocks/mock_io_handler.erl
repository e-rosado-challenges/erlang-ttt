-module(mock_io_handler).
-export([request_space/1, print_winner/1]).

request_space(AvailableSpaces) ->
  Moves = lists:filter(fun(Space) -> Space rem 2 =:= 0 end, AvailableSpaces),
  lists:last(Moves).

print_winner(Marker) -> prompt:win(Marker).