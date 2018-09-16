-module(end_game_conditions).
-export([is_tie_game/1, is_horizontal_win/1]).

is_tie_game([]) -> true;
is_tie_game([Space|_Spaces]) when is_integer(Space) -> false;
is_tie_game([_Space|Spaces]) -> is_tie_game(Spaces).

is_horizontal_win(Board) ->
  BoardLength = get_board_length(Board),
  Rows = get_rows(Board, 1, BoardLength, []),
  RowStatus = lists:map(fun(Row) -> is_the_same_marker(Row) end, Rows),
  lists:member(true, RowStatus).

get_rows(Board, Offset, BoardLength, Rows) when Offset < length(Board)  ->
  Row = lists:sublist(Board, Offset, BoardLength),
  get_rows(Board, Offset + BoardLength , BoardLength, [Row| Rows]);
get_rows(_Board, _Offset, _BoardLength, Rows) ->
  Rows.

get_board_length(Board) ->
  Spaces = length(Board),
  trunc(math:sqrt(Spaces)).

is_the_same_marker([]) -> true;
is_the_same_marker([Space1,Space2|_Spaces]) when Space1 /= Space2 -> false;
is_the_same_marker([_Space|Spaces]) -> is_the_same_marker(Spaces).