-module(board_builder_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [get_display_board_test/0]}).

get_display_board_test() ->
  [{"it will return a board to be displayed to the user",
    ?assertEqual("_1_|_2_|_3_\n"++
                 "_4_|_5_|_6_\n"++
                 " 7 | 8 | 9 \n",
                 board_builder:get_display_board([1,2,3,4,5,6,7,8,9])),
    ?assertEqual("_X_|_2_|_3_\n"++
                 "_4_|_X_|_6_\n"++
                 " O | O | 9 \n",
                 board_builder:get_display_board(["X",2,3,4,"X",6,"O","O",9]))
  }].
