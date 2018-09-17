-module(computer_logic).
-export([get_available_spaces/2, switch_marker/1, place_marker/3,
        get_score/2, get_board_states/2]).
-define(PLAYER, x).
-define(COMPUTER, o).

get_board_states(Board, Marker) -> get_board_states(Board, Board, [], Marker).

get_board_states(_Board, [], BoardStates, _Marker) -> BoardStates;
get_board_states(Board, [Space|Spaces], BoardStates, Marker) when
                                                           is_integer(Space) ->
  NewBoardState = place_marker(Board, Space, Marker),
  get_board_states(Board, Spaces, [NewBoardState|BoardStates], Marker);
get_board_states(Board, [_Space|Spaces], BoardStates, Marker) ->
  get_board_states(Board, Spaces, BoardStates, Marker).

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

get_score(Condition, Marker) ->
  MaximumScore = 10,
  MinimumScore = -10,
  TieScore = 0,

  case {Condition, Marker} of
    {tie_game, _} -> TieScore;
    {_, ?PLAYER} -> MinimumScore;
    {_, ?COMPUTER} -> MaximumScore
  end.