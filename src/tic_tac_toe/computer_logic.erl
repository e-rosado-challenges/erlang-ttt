-module(computer_logic).
-export([get_available_spaces/2]).

get_available_spaces([Space|Spaces], AvailableSpaces) when is_integer(Space) ->
  get_available_spaces(Spaces, [Space|AvailableSpaces]);
get_available_spaces([_Space|Spaces], AvailableSpaces) ->
  get_available_spaces(Spaces, AvailableSpaces);
get_available_spaces([], AvailableSpaces) -> lists:reverse(AvailableSpaces).