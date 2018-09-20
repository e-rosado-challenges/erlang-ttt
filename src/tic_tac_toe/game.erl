-module(game).
-export([get_player_move/2, get_computer_move/2, play_game/3]).

play_game(_Board, View, {_Condition, GameOver}) when GameOver ->
  View:print_winner("O");
play_game(Board, View, _GameOver) ->
  PlayerUpdatedBoard = get_player_move(Board, View),
  ComputerUpdatedBoard = get_computer_move(PlayerUpdatedBoard, "O"),
  play_game(ComputerUpdatedBoard, View,
            end_game_conditions:is_game_over(ComputerUpdatedBoard)).

get_player_move(Board, View) ->
  AvailableSpaces = board:get_available_spaces(Board, []),
  Move = View:request_space(AvailableSpaces),
  board:place_marker(Board, Move, "X").

get_computer_move(Board, Marker) ->
  computer_logic:make_best_move(Board, Marker).