-module(board_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [new_board_test/0, place_marker_test/0, switch_marker_test/0,
                                   get_board_length_test/0, get_available_spaces_test/0]}).

new_board_test() ->
  {"it will return a new board",
    ?assertEqual([1,2,3,4,5,6,7,8,9], board:new_board(_Length = 3))
  }.

place_marker_test() ->
  {"it will add a new marker to the board on at the designated space",
    ?assertEqual([x,o,3,4,5,6,7,8,9],
                 board:place_marker(_Board = [x,2,3,4,5,6,7,8,9],
                                             _AvailableSpace = 2,
                                             _Marker = o)),
    ?assertEqual([x,2,x,x,5,o,7,o,9],
                 board:place_marker(_Board = [x,2,x,4,5,o,7,o,9],
                                             _AvailableSpace = 4,
                                             _Marker = x))
  }.

switch_marker_test() ->
  {"it will switch the marker to the other available marker",
    ?assertEqual(o,
                 board:switch_marker(x)),
    ?assertEqual(x,
                 board:switch_marker(o))
  }.

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