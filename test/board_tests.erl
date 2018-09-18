-module(board_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [get_board_length_test/0]}).

get_board_length_test() ->
  {"it will return the length of a board",
    ?assertEqual(3, board:get_board_length([1,2,3,4,5,6,7,8,9]))
  }.