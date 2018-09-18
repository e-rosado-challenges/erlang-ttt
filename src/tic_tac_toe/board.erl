-module(board).
-export([place_marker/3, switch_marker/1, get_board_length/1,
         get_available_spaces/2]).
-include("board.hrl").

place_marker(Board, AvailableSpace, Marker) ->
  lists:sublist(Board, AvailableSpace - 1)
         ++ [Marker]
         ++ lists:nthtail(AvailableSpace, Board).

switch_marker(Marker) when Marker =:= ?PLAYER -> ?COMPUTER;
switch_marker(_Marker) -> ?PLAYER.

get_board_length(Board) ->
  Spaces = length(Board),
  trunc(math:sqrt(Spaces)).

get_available_spaces([Space|Spaces], AvailableSpaces) when is_integer(Space) ->
  get_available_spaces(Spaces, [Space|AvailableSpaces]);
get_available_spaces([_Space|Spaces], AvailableSpaces) ->
  get_available_spaces(Spaces, AvailableSpaces);
get_available_spaces([], AvailableSpaces) -> AvailableSpaces.