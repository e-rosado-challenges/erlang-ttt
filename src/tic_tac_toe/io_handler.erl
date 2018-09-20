-module(io_handler).
-export([print/1, print_greeting/0, invalid_entry/0, print_board/1,
         print_winner/1, print_tie/0, request_space/1,
         request_space/3, validate_move/4]).

print(Item) -> io:fwrite(Item).

print_greeting() -> print(prompt:greeting()).

print_board(Board) -> print(board_builder:get_display_board(Board)).

invalid_entry() -> print(prompt:invalid_entry()).

print_winner(Marker) -> print(prompt:win(Marker)).

print_tie() -> print(prompt:tie()).

read_input(Prompt) -> io:fread(Prompt, "~s").

request_space(AvailableSpaces) ->
  request_space(io_handler, AvailableSpaces, read_input(prompt:choose_space())).

request_space(View, AvailableSpaces, {_Status, [Input]}) ->
  try list_to_integer(Input) of
    Move ->
      AvailableMove = lists:member(Move, AvailableSpaces),
      validate_move(View, AvailableMove, AvailableSpaces, Move)
  catch
    error:_ ->
      invalid_entry(),
      View:request_space(AvailableSpaces)
  end.

validate_move(_View, AvailableMove, _AvailableSpaces, Move)
when AvailableMove -> Move;
validate_move(View, _AvailableMove, AvailableSpaces, _Move) ->
  invalid_entry(),
  View:request_space(AvailableSpaces).