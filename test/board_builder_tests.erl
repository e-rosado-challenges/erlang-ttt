-module(board_builder_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [build_top_rows_test/0]}).

build_top_rows_test() ->
  [{"it will return a string representation of the top rows with no markers",
    ?assertEqual("_1_|_2_|_3_", board_builder:build_top_rows(_BoardLength = 3,
                                                             _GameBoardRow = [1,2,3],
                                                             _UpdatedRow = []))
  },
  {"it will return a string representation of the top row with markers",
    ?assertEqual("_X_|_2_|_O_", board_builder:build_top_rows(_BoardLength = 3,
                                                             _GameBoardRow = ["X",2,"O"],
                                                             _UpdatedRow = [])),
                                                             
    ?assertEqual("_X_|_X_|_3_", board_builder:build_top_rows(_BoardLength = 3,
                                                             _GameBoardRow = ["X","X",3],
                                                             _UpdatedRow = []))
  }].
