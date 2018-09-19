-module(prompt).
-export([greeting/0, choose_space/0, invalid_entry/0,
         win/1, tie/0]).

greeting() ->
  "Welcome to Tic Tac Toe!".

choose_space() ->
  "Please choose an empty space, designated by a number.".

invalid_entry() ->
  "Your entry is invalid.".

win(Marker) ->
  Marker ++ " Wins!".

tie() ->
  "Tie Game!".