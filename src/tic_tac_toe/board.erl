-module(board).
-export([get_board_length/1]).

get_board_length(Board) ->
  Spaces = length(Board),
  trunc(math:sqrt(Spaces)).