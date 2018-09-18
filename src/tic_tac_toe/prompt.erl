-module(prompt).
-export([greeting/0, choose_space/0, space_not_available/0,
         win/1, tie/0]).

greeting() ->
  "Welcome to Tic Tac Toe!".

choose_space() ->
  "Please choose an empty space, designated by a number.".

space_not_available() ->
  "The space you have chosen is not available.".

win(Marker) ->
  Marker ++ " Wins!".

tie() ->
  "Tie Game!".