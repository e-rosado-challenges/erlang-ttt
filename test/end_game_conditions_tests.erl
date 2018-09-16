-module(end_game_conditions_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [is_tie_game_test/0, is_horizontal_win_test/0, 
                                   is_vertical_win_test/0, is_forward_diagonal_win_test/0]}).

is_tie_game_test() ->
  [{"it will return true if there is no winner and all spaces on the board are occupied",
    ?assertEqual(true, 
                 end_game_conditions:is_tie_game([x,o,x,x,o,x,o,x,o])),
    ?assertEqual(true, 
                 end_game_conditions:is_tie_game([o,x,o,o,x,o,x,o,x]))
  },
  {"it will return false if there are available spaces on the board, indicated by an integer",
    ?assertEqual(false, 
                 end_game_conditions:is_tie_game([x,o,x,x,o,x,o,8,o])),
    ?assertEqual(false, 
                 end_game_conditions:is_tie_game([1,o,x,x,o,x,o,x,o]))
  }].

is_horizontal_win_test() ->
  [{"it will return true if there is a horizontal win",
    ?assertEqual(true,
                 end_game_conditions:is_horizontal_win([x,x,x,4,5,6,7,o,o])),
    ?assertEqual(true,
                 end_game_conditions:is_horizontal_win([1,x,3,o,o,o,7,x,x]))
  },
  {"it will return false if there is not a horizontal win",
    ?assertEqual(false,
                 end_game_conditions:is_horizontal_win([x,2,x,4,5,6,7,o,o])),
    ?assertEqual(false,
                 end_game_conditions:is_horizontal_win([1,o,o,4,x,6,7,x,x]))
  }].

is_vertical_win_test() ->
  [{"it will return true if there is a vertical win",
    ?assertEqual(true,
                 end_game_conditions:is_vertical_win([x,2,3,x,5,6,x,o,o])),
    ?assertEqual(true,
                 end_game_conditions:is_vertical_win([x,o,3,x,o,6,7,o,x]))
  },
  {"it will return false if there is not a vertical win",
    ?assertEqual(false,
                 end_game_conditions:is_horizontal_win([x,2,x,4,5,6,7,o,o])),
    ?assertEqual(false,
                 end_game_conditions:is_horizontal_win([1,o,o,4,x,6,7,x,x]))
  }].

is_forward_diagonal_win_test() ->
  [{"it will return true if there is a vertical win",
    ?assertEqual(true,
                 end_game_conditions:is_forward_diagonal_win([1,2,x,4,x,6,x,o,o])),
    ?assertEqual(true,
                 end_game_conditions:is_forward_diagonal_win([x,2,o,4,o,6,o,x,x]))
  },
  {"it will return false if there is not a vertical win",
    ?assertEqual(false,
                 end_game_conditions:is_forward_diagonal_win([x,2,x,4,5,6,7,o,o])),
    ?assertEqual(false,
                 end_game_conditions:is_forward_diagonal_win([1,o,o,4,x,6,7,x,x]))
  }].