-module(game).
-export([get_player_move/2, get_computer_move/2, play_game/2]).

play_game(Board, View) ->
  UpdatedBoard = get_player_move(Board, View),
  get_computer_move(UpdatedBoard, "O").

get_player_move(Board, View) ->
  AvailableSpaces = board:get_available_spaces(Board, []),
  Move = View:request_space(AvailableSpaces),
  board:place_marker(Board, Move, "X").

get_computer_move(Board, Marker) ->
  computer_logic:make_best_move(Board, Marker).