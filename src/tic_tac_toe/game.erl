-module(game).
-export([get_player_move/2]).

get_player_move(Board, View) ->
  AvailableSpaces = board:get_available_spaces(Board, []),
  Move = View:request_space(AvailableSpaces),
  board:place_marker(Board, Move, "X").