-module(board_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [get_board_length_test/0, get_available_spaces_test/0]}).

get_board_length_test() ->
  {"it will return the length of a board",
    ?assertEqual(3, board:get_board_length([1,2,3,4,5,6,7,8,9]))
  }.

get_available_spaces_test() ->
  {"it will return available spaces when given a Board.",
    ?assertEqual([9,8,7,6,5,4,3,2],
                 board:get_available_spaces([x,2,3,4,5,6,7,8,9], [])),
    ?assertEqual([9,8,6,5,3,2],
                 board:get_available_spaces([x,2,3,o,5,6,x,8,9], []))
  }.