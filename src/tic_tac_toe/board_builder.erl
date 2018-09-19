-module(board_builder).
-export([build_top_rows/3, build_bottom_row/3]).

build_top_rows(BoardLength, [LeftCell|Cells], Row)
when is_integer(LeftCell), BoardLength > 1 ->
  UpdatedCell = "_" ++ integer_to_list(LeftCell) ++ "_|",
  build_top_rows(BoardLength - 1, Cells, [UpdatedCell|Row]);
build_top_rows(BoardLength, [LeftCell|Cells], Row) when BoardLength > 1 ->
  UpdatedCell = "_" ++ LeftCell ++ "_|",
  build_top_rows(BoardLength - 1, Cells, [UpdatedCell|Row]);
build_top_rows(_BoardLength, [RightCell|_Cells], Row)
when is_integer(RightCell) ->
  UpdatedCell = "_" ++ integer_to_list(RightCell) ++ "_",
  lists:concat(lists:reverse([UpdatedCell|Row]));
build_top_rows(_BoardLength, [RightCell|_Cells], Row) ->
  UpdatedCell = "_" ++ RightCell ++ "_",
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
  UpdatedCell = " " ++ integer_to_list(RightCell) ++ " ",
  lists:concat(lists:reverse([UpdatedCell|Row]));
build_bottom_row(_BoardLength, [RightCell|_Cells], Row) ->
  UpdatedCell = " " ++ RightCell ++ " ",
  lists:concat(lists:reverse([UpdatedCell|Row])).