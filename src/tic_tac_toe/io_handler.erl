-module(io_handler).
-export([print/1, print_greeting/0, invalid_entry/0,
         print_winner/1, print_tie/0, read_input/1, request_space/0,
         request_space/2]).

print(Item) -> io:fwrite(Item).

print_greeting() -> print(prompt:print_greeting()).

invalid_entry() -> print(prompt:invalid_entry()).

print_winner(Marker) -> print(prompt:win(Marker)).

print_tie() -> print(prompt:tie()).

read_input(Prompt) -> io:fread(Prompt, "~s").

request_space() ->
  request_space(read_input(prompt:choose_space()), request_space()).

request_space({_Status, [Input]}, RequestSpace) ->
  try list_to_integer(Input) of
    Result -> Result
  catch
    error:_ -> RequestSpace
  end.


