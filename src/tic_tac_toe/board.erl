-module(board).
-export([get_board_length/1, get_available_spaces/2]).

get_board_length(Board) ->
  Spaces = length(Board),
  trunc(math:sqrt(Spaces)).

get_available_spaces([Space|Spaces], AvailableSpaces) when is_integer(Space) ->
  get_available_spaces(Spaces, [Space|AvailableSpaces]);
get_available_spaces([_Space|Spaces], AvailableSpaces) ->
  get_available_spaces(Spaces, AvailableSpaces);
get_available_spaces([], AvailableSpaces) -> AvailableSpaces.