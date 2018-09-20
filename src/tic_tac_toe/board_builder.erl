-module(board_builder).
-export([get_display_board/1]).

get_display_board(Board) ->
  BoardLength = board:get_board_length(Board),
  StartingCell = 1,
  Rows = lists:reverse(
    board:get_rows(Board, StartingCell, BoardLength, [])
  ),
  build_display_board(BoardLength, Rows, []).

build_display_board(BoardLength, [Row|Rows], DisplayBoard)
when length(Rows) >= 1 ->
  DisplayRow = build_top_rows(BoardLength, Row, []),
  build_display_board(BoardLength, Rows, [DisplayRow|DisplayBoard]);
build_display_board(BoardLength, [Row|Rows], DisplayBoard) ->
  DisplayRow = build_bottom_row(BoardLength, Row, []),
  build_display_board(BoardLength, Rows, [DisplayRow|DisplayBoard]);
build_display_board(_BoardLength, [], DisplayBoard) ->
  lists:concat(lists:reverse(DisplayBoard)).

build_top_rows(BoardLength, [LeftCell|Cells], Row)
when is_integer(LeftCell), BoardLength > 1 ->
  UpdatedCell = "_" ++ integer_to_list(LeftCell) ++ "_|",
  build_top_rows(BoardLength - 1, Cells, [UpdatedCell|Row]);
build_top_rows(BoardLength, [LeftCell|Cells], Row) when BoardLength > 1 ->
  UpdatedCell = "_" ++ LeftCell ++ "_|",
  build_top_rows(BoardLength - 1, Cells, [UpdatedCell|Row]);
build_top_rows(_BoardLength, [RightCell|_Cells], Row)
when is_integer(RightCell) ->
  UpdatedCell = "_" ++ integer_to_list(RightCell) ++ "_\n",
  lists:concat(lists:reverse([UpdatedCell|Row]));
build_top_rows(_BoardLength, [RightCell|_Cells], Row) ->
  UpdatedCell = "_" ++ RightCell ++ "_\n",
  lists:concat(lists:reverse([UpdatedCell|Row])).

build_bottom_row(BoardLength, [LeftCell|Cells], Row)
when is_integer(LeftCell), BoardLength > 1 ->
  UpdatedCell = " " ++ integer_to_list(LeftCell) ++ " |",
  build_bottom_row(BoardLength - 1, Cells, [UpdatedCell|Row]);
build_bottom_row(BoardLength, [LeftCell|Cells], Row) when BoardLength > 1 ->
  UpdatedCell = " " ++ LeftCell ++ " |",
  build_bottom_row(BoardLength - 1, Cells, [UpdatedCell|Row]);
build_bottom_row(_BoardLength, [RightCell|_Cells], Row)
when is_integer(RightCell) ->
  UpdatedCell = " " ++ integer_to_list(RightCell) ++ " \n",
  lists:concat(lists:reverse([UpdatedCell|Row]));
build_bottom_row(_BoardLength, [RightCell|_Cells], Row) ->
  UpdatedCell = " " ++ RightCell ++ " \n",
  lists:concat(lists:reverse([UpdatedCell|Row])).