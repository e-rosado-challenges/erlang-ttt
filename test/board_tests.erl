-module(board_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [new_board_test/0, place_marker_test/0, switch_marker_test/0,
                                   get_board_length_test/0, get_available_spaces_test/0,
                                   get_rows_test/0, get_columns_test/0,
                                   get_forward_diagonal_test/0, get_backward_diagonal_test/0]}).

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
  {"it will return available spaces when given a Board",
    ?assertEqual([9,8,7,6,5,4,3,2],
                 board:get_available_spaces([x,2,3,4,5,6,7,8,9], [])),
    ?assertEqual([9,8,6,5,3,2],
                 board:get_available_spaces([x,2,3,o,5,6,x,8,9], []))
  }.

get_rows_test() ->
  {"it will return the rows of a given board",
    ?assertEqual([[7,8,9],[4,5,6],[1,2,3]],
                 board:get_rows(_Board = [1,2,3,4,5,6,7,8,9],
                                _StartingPoint = 1,
                                _BoardLength = 3,
                                _Rows = [])),
    ?assertEqual([["X",8,9],["X",5,"O"],["O",2,3]],
                 board:get_rows(_Board = ["O",2,3,"X",5,"O","X",8,9],
                                _StartingPoint = 1,
                                _BoardLength = 3,
                                _Rows = []))
  }.

get_columns_test() -> 
  {"it will return the columns of a given board",
    ?assertEqual([[3,6,9],[2,5,8],[1,4,7]],
                 board:get_columns(_Board = [1,2,3,4,5,6,7,8,9],
                                   _StartingPoint = 1,
                                   _Endpoint = 9,
                                   _Incrementer = 3,
                                   _Columns = [])),
    ?assertEqual([["X",6,9],[2,"O",8],[1,4,"X"]],
                 board:get_columns(_Board = [1,2,"X",4,"O",6,"X",8,9],
                                   _StartingPoint = 1,
                                   _Endpoint = 9,
                                   _Incrementer = 3,
                                   _Columns = []))
  }.

  get_forward_diagonal_test() ->
    {"it will return the forward diagonal spaces when given a board",
      ?assertEqual([3,5,7],
                 board:get_forward_diagonal(_Board = [1,2,3,4,5,6,7,8,9], 
                                            _BoardLength = 3)),
      ?assertEqual(["X",5,7],
                 board:get_forward_diagonal(_Board = [1,2,"X",4,5,6,7,8,9], 
                                            _BoardLength = 3))
    }.

    get_backward_diagonal_test() ->
    {"it will return the backward diagonal spaces when given a board",
      ?assertEqual([1,5,9],
                 board:get_backward_diagonal(_Board = [1,2,3,4,5,6,7,8,9], 
                                            _BoardLength = 3)),
      ?assertEqual([1,"X",9],
                 board:get_backward_diagonal(_Board = [1,2,3,4,"X",6,7,8,9], 
                                            _BoardLength = 3))
    }.