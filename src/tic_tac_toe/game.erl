-module(game).
-export([get_player_move/3, get_computer_move/2, play_game/4]).

play_game(Marker, _Board, View, {Condition, GameOver}) when GameOver ->
  case Condition of
    tie_game -> View:print_tie();
    _ -> View:print_winner(Marker)
  end;
play_game(Marker, Board, View, _GameOver) ->
  PlayerUpdatedBoard = get_player_move(Marker, Board, View),
  ComputerMarker = board:switch_marker(Marker),
  ComputerUpdatedBoard = get_computer_move(PlayerUpdatedBoard, ComputerMarker),
  PlayerMarker = board:switch_marker(Marker),
  play_game(PlayerMarker, ComputerUpdatedBoard, View,
            end_game_conditions:is_game_over(ComputerUpdatedBoard)).

get_player_move(Marker, Board, View) ->
  AvailableSpaces = board:get_available_spaces(Board, []),
  Move = View:request_space(AvailableSpaces),
  board:place_marker(Board, Move, Marker).

get_computer_move(Board, Marker) ->
  computer_logic:make_best_move(Board, Marker).