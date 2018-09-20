-module(io_handler).
-export([print/1, print_greeting/0, invalid_entry/0, print_board/1,
         print_winner/1, print_tie/0, read_input/1, request_space/1,
         request_space/3, validate_move/3]).

print(Item) -> io:fwrite(Item).

print_greeting() -> print(prompt:greeting()).

print_board(Board) -> print(board_builder:get_display_board(Board)).

invalid_entry() -> print(prompt:invalid_entry()).

print_winner(Marker) -> print(prompt:win(Marker)).

print_tie() -> print(prompt:tie()).

read_input(Prompt) -> io:fread(Prompt, "~s").

request_space(AvailableSpaces) ->
  request_space(AvailableSpaces, read_input(prompt:choose_space()),
                request_space(AvailableSpaces)).

request_space(AvailableSpaces, {_Status, [Input]}, RequestSpace) ->
  try list_to_integer(Input) of
    Move ->
      AvailableMove = lists:member(Move, AvailableSpaces),
      validate_move(AvailableMove, RequestSpace, Move)
  catch
    error:_ ->
      invalid_entry(),
      RequestSpace
  end.

validate_move(AvailableMove, _RequestSpace, Move)
when AvailableMove -> Move;
validate_move(_AvailableMove, RequestSpace, _Move) ->
  invalid_entry(),
  RequestSpace.