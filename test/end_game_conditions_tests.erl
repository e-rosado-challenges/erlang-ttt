-module(end_game_conditions_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [is_tie_game_test/0]}).

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