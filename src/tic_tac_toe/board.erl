-module(board).
-export([new_board/1, place_marker/3, switch_marker/1, get_board_length/1,
         get_available_spaces/2, get_rows/4, get_columns/5,
         get_forward_diagonal/2, get_backward_diagonal/2]).
-include("board.hrl").

new_board(Length) ->
  NumberOfSpaces = trunc(math:pow(Length, 2)),
  lists:seq(1, NumberOfSpaces).

place_marker(Board, AvailableSpace, Marker) ->
  lists:sublist(Board, AvailableSpace - 1)
         ++ [Marker]
         ++ lists:nthtail(AvailableSpace, Board).

switch_marker(Marker) when Marker =:= ?PLAYER -> ?COMPUTER;
switch_marker(_Marker) -> ?PLAYER.

get_board_length(Board) ->
  Spaces = length(Board),
  trunc(math:sqrt(Spaces)).

get_available_spaces([Space|Spaces], AvailableSpaces) when is_integer(Space) ->
  get_available_spaces(Spaces, [Space|AvailableSpaces]);
get_available_spaces([_Space|Spaces], AvailableSpaces) ->
  get_available_spaces(Spaces, AvailableSpaces);
get_available_spaces([], AvailableSpaces) -> AvailableSpaces.

get_rows(Board, StartingPoint, TotalLength, Rows)
when StartingPoint < length(Board)  ->
  Row = lists:sublist(Board, StartingPoint, TotalLength),
  NewStartingPoint = StartingPoint + TotalLength,
  get_rows(Board, NewStartingPoint, TotalLength, [Row| Rows]);
get_rows(_Board, _StartingPoint, _TotalLength, Rows) -> Rows.

get_columns(Board, StartingPoint, EndPoint, Incrementer, Columns)
when StartingPoint =< Incrementer ->
  Spaces = lists:seq(StartingPoint, EndPoint, Incrementer),
  Column = lists:map(fun(Space) -> lists:nth(Space, Board) end, Spaces),
  NewStartingPoint = StartingPoint + 1,
  get_columns(Board, NewStartingPoint, EndPoint, Incrementer, [Column|Columns]);
get_columns(_Board, _StartingPoint, _EndPoint, _Incrementer, Sets) -> Sets.

get_forward_diagonal(Board, BoardLength) ->
  Incrementer = BoardLength - 1,
  StartingPoint = BoardLength,
  EndPoint = length(Board) - Incrementer,
  Spaces = lists:seq(StartingPoint, EndPoint, Incrementer),
  lists:map(fun(Space) -> lists:nth(Space, Board) end, Spaces).

get_backward_diagonal(Board, BoardLength) ->
  Incrementer = BoardLength + 1,
  StartingPoint = 1,
  EndPoint = length(Board),
  Spaces = lists:seq(StartingPoint, EndPoint, Incrementer),
  lists:map(fun(Space) -> lists:nth(Space, Board) end, Spaces).