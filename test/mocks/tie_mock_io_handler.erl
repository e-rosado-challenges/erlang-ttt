-module(tie_mock_io_handler).
-export([request_space/1, print_winner/1, print_tie/0,
         print_board/1]).

request_space(AvailableSpaces) ->
  case length(AvailableSpaces) of
    9 -> 1;
    7 -> 3;
    5 -> 8;
    3 -> 6;
    1 -> 7
  end.

print_board(Board) -> board_builder:get_display_board(Board).

print_winner(Marker) -> prompt:win(Marker).

print_tie() -> prompt:tie().