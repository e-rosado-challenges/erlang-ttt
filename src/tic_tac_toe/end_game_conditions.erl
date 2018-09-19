-module(end_game_conditions).
-export([is_game_over/1]).

is_game_over(Board) ->
  GameStatus = {is_horizontal_win(Board), is_vertical_win(Board),
                is_forward_diagonal_win(Board), is_backward_diagonal_win(Board),
                is_tie_game(Board)
               },
  case GameStatus of
    {true, _, _, _, _} -> {horizontal_win, true};
    {_, true, _, _, _} -> {vertical_win, true};
    {_, _, true, _, _} -> {forward_diagonal_win, true};
    {_, _, _, true, _} -> {backward_diagonal_win, true};
    {_, _, _, _, true} -> {tie_game, true};
    {_, _, _, _, _} -> {no_winner, false}
  end.

is_tie_game([]) -> true;
is_tie_game([Space|_Spaces]) when is_integer(Space) -> false;
is_tie_game([_Space|Spaces]) -> is_tie_game(Spaces).

is_horizontal_win(Board) ->
  BoardLength = board:get_board_length(Board),
  Rows = board:get_rows(Board, 1, BoardLength, []),
  RowStatus = lists:map(fun(Row) -> is_the_same_marker(Row) end, Rows),
  lists:member(true, RowStatus).

is_vertical_win(Board) ->
  BoardLength = board:get_board_length(Board),
  Columns = board:get_columns(Board, 1, length(Board), BoardLength, []),
  ColumnStatus = lists:map(fun(Column) ->
                             is_the_same_marker(Column)
                           end, Columns),
  lists:member(true, ColumnStatus).

is_forward_diagonal_win(Board) ->
  BoardLength = board:get_board_length(Board),
  Diagonal = board:get_forward_diagonal(Board, BoardLength),
  is_the_same_marker(Diagonal).

is_backward_diagonal_win(Board) ->
  BoardLength = board:get_board_length(Board),
  Diagonal = board:get_backward_diagonal(Board, BoardLength),
  is_the_same_marker(Diagonal).

is_the_same_marker([]) -> true;
is_the_same_marker([Space1, Space2|_Spaces]) when Space1 /= Space2 -> false;
is_the_same_marker([_Space|Spaces]) -> is_the_same_marker(Spaces).