-module(computer_logic).
-export([get_available_spaces/2, switch_marker/1, place_marker/3,
        get_score/2]).
-define(PLAYER, x).
-define(COMPUTER, o).

get_available_spaces([Space|Spaces], AvailableSpaces) when is_integer(Space) ->
  get_available_spaces(Spaces, [Space|AvailableSpaces]);
get_available_spaces([_Space|Spaces], AvailableSpaces) ->
  get_available_spaces(Spaces, AvailableSpaces);
get_available_spaces([], AvailableSpaces) -> AvailableSpaces.

switch_marker(Marker) when Marker =:= ?PLAYER -> ?COMPUTER;
switch_marker(_Marker) -> ?PLAYER.

place_marker(Board, AvailableSpace, Marker) ->
  lists:sublist(Board, AvailableSpace - 1)
         ++ [Marker]
         ++ lists:nthtail(AvailableSpace, Board).

get_score(Board, Marker) ->
  MaximumScore = 10,
  MinimumScore = -10,
  TieScore = 0,
  {Condition, Status} = end_game_conditions:is_game_over(Board),

case {Condition, Status, Marker} of
  {tie_game, true, _} -> TieScore;
  {_, true, ?PLAYER} -> MinimumScore;
  {_, true, ?COMPUTER} -> MaximumScore
end.