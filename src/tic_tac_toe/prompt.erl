-module(prompt).
-export([greeting/0, start/0, choose_space/0, invalid_entry/0,
         win/1, tie/0]).

greeting() ->
  "Welcome to Tic Tac Toe!\n".

start() ->
  "Please type 'start' and then press enter to begin.\n".

choose_space() ->
  "Please choose an empty space, designated by a number.\n".

invalid_entry() ->
  "Your entry is invalid.\n".

win(Marker) ->
  Marker ++ " Wins!\n".

tie() ->
  "Tie Game!\n".