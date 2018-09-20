-module(game).
-export([initialize_game/1]).
-include("board.hrl").

initialize_game(View) ->
  Marker = "X",
  Board = board:new_board(3),
  GameOver = end_game_conditions:is_game_over(Board),
  play_game(Marker, Board, View, GameOver).

play_game(Marker, Board, View, {Condition, GameOver}) when GameOver ->
  View:print_board(Board),
  LastActiveMarker = board:switch_marker(Marker),
  case Condition of
    tie_game -> View:print_tie();
    _ -> View:print_winner(LastActiveMarker)
  end;
play_game(Marker, Board, View, _GameOver) when Marker =:= ?PLAYER ->
  View:print_board(Board),
  PlayerUpdatedBoard = get_player_move(Marker, Board, View),
  ComputerMarker = board:switch_marker(Marker),
  View:clear(),
  play_game(ComputerMarker, PlayerUpdatedBoard, View,
            end_game_conditions:is_game_over(PlayerUpdatedBoard));
play_game(Marker, Board, View, _GameOver) when Marker =:= ?COMPUTER ->
  ComputerUpdatedBoard = get_computer_move(Board, Marker),
  PlayerMarker = board:switch_marker(Marker),
  play_game(PlayerMarker, ComputerUpdatedBoard, View,
            end_game_conditions:is_game_over(ComputerUpdatedBoard)).

get_player_move(Marker, Board, View) ->
  AvailableSpaces = board:get_available_spaces(Board, []),
  Move = View:request_space(AvailableSpaces),
  board:place_marker(Board, Move, Marker).

get_computer_move(Board, Marker) ->
  computer_logic:make_best_move(Board, Marker).