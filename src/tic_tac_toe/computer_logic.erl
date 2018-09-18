-module(computer_logic).
-export([switch_marker/1, place_marker/3,
        get_score/3, get_board_states/2, get_board_state_score/2,
        make_best_move/2]).
-define(PLAYER, x).
-define(COMPUTER, o).

make_best_move(Board, Marker) ->
  BoardStates = get_board_states(Board, Marker),
  Scores = get_scores(BoardStates, Marker),
  StatesAndScores = lists:zip(Scores, BoardStates),
  SortedStatesAndValues = lists:keysort(1, StatesAndScores),
  [{_Score, BestBoard}|_Boards] = lists:reverse(SortedStatesAndValues),
  BestBoard.

get_board_state_score(Board, Marker) ->
  IsGameOver = end_game_conditions:is_game_over(Board),
  get_board_state_score(Board, Marker, IsGameOver).

get_board_state_score(Board, Marker, {Condition, GameOver})
when GameOver =:= true ->
  WinningMarker = switch_marker(Marker),
  get_score(Condition, WinningMarker, Board);
get_board_state_score(Board, Marker, _IsGameOver) ->
  BoardStates = get_board_states(Board, Marker),
  Scores = get_scores(BoardStates, Marker),
  get_best_score(Scores, Marker).

get_scores(BoardStates, Marker) ->
  lists:map(fun(BoardState) ->
                      NextMarker = switch_marker(Marker),
                      get_board_state_score(BoardState, NextMarker)
                     end, BoardStates).

get_best_score(Scores, Marker) when Marker =:= ?PLAYER ->
  lists:min(lists:flatten(Scores));
get_best_score(Scores, _Marker) -> lists:max(lists:flatten(Scores)).

get_board_states(Board, Marker) -> get_board_states(Board, Board, [], Marker).

get_board_states(_Board, [], BoardStates, _Marker) -> BoardStates;
get_board_states(Board, [Space|Spaces], BoardStates, Marker)
when is_integer(Space) ->
  NewBoardState = place_marker(Board, Space, Marker),
  get_board_states(Board, Spaces, [NewBoardState|BoardStates], Marker);
get_board_states(Board, [_Space|Spaces], BoardStates, Marker) ->
  get_board_states(Board, Spaces, BoardStates, Marker).

get_score(Condition, Marker, Board) ->
  MaximumScore = 10,
  MinimumScore = -10,
  TieScore = 0,
  Depth = length(Board) - length(board:get_available_spaces(Board, [])),

  case {Condition, Marker} of
    {tie_game, _} -> TieScore;
    {_, ?PLAYER} -> MinimumScore + Depth;
    {_, ?COMPUTER} -> MaximumScore - Depth
  end.

switch_marker(Marker) when Marker =:= ?PLAYER -> ?COMPUTER;
switch_marker(_Marker) -> ?PLAYER.

place_marker(Board, AvailableSpace, Marker) ->
  lists:sublist(Board, AvailableSpace - 1)
         ++ [Marker]
         ++ lists:nthtail(AvailableSpace, Board).