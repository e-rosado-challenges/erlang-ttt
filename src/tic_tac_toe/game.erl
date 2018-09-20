-module(game).
-export([initialize_game/1, get_player_move/3, get_computer_move/2,
         play_game/4]).

initialize_game(View) ->
  Marker = "X",
  Board = board:new_board(3),
  GameOver = end_game_conditions:is_game_over(Board),
  play_game(Marker, Board, View, GameOver).

play_game(Marker, _Board, View, {Condition, GameOver}) when GameOver ->
  LastActiveMarker = board:switch_marker(Marker),
  case Condition of
    tie_game -> View:print_tie();
    _ -> View:print_winner(LastActiveMarker)
  end;
play_game(Marker, Board, View, _GameOver) when Marker =:= "X" ->
  PlayerUpdatedBoard = get_player_move(Marker, Board, View),
  ComputerMarker = board:switch_marker(Marker),
  play_game(ComputerMarker, PlayerUpdatedBoard, View,
            end_game_conditions:is_game_over(PlayerUpdatedBoard));
play_game(Marker, Board, View, _GameOver) when Marker =:= "O" ->
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