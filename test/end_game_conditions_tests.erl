-module(end_game_conditions_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [is_game_over_test/0]}).

is_game_over_test() -> 
  [{"it will return true if there is a horizontal win",
    ?assertEqual({horizontal_win, true},
                 end_game_conditions:is_game_over([x,x,x,4,5,6,7,o,o])),
    ?assertEqual({horizontal_win, true},
                 end_game_conditions:is_game_over([1,x,3,o,o,o,7,x,x]))
  },
  {"it will return false if there is not a horizontal win",
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over([x,2,x,4,5,6,7,o,o])),
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over([1,o,o,4,x,6,7,x,x]))
  },
  {"it will return true if there is a vertical win",
    ?assertEqual({vertical_win, true},
                 end_game_conditions:is_game_over([x,2,3,x,5,6,x,o,o])),
    ?assertEqual({vertical_win, true},
                 end_game_conditions:is_game_over([x,o,3,x,o,6,7,o,x]))
  },
  {"it will return false if there is not a vertical win",
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over([x,2,x,4,5,6,7,o,o])),
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over([1,o,o,4,x,6,7,x,x]))
  },
  {"it will return true if there is a forward diagonal win",
    ?assertEqual({forward_diagonal_win, true},
                 end_game_conditions:is_game_over([1,2,x,4,x,6,x,o,o])),
    ?assertEqual({forward_diagonal_win, true},
                 end_game_conditions:is_game_over([x,2,o,4,o,6,o,x,x]))
  },
  {"it will return false if there is not a forward diagonal win",
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over([x,2,x,4,5,6,7,o,o])),
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over([1,o,o,4,x,6,7,x,x]))
  },
  {"it will return true if there is a backward diagonal win",
    ?assertEqual({backward_diagonal_win, true},
                 end_game_conditions:is_game_over([x,2,3,4,x,6,o,o,x])),
    ?assertEqual({backward_diagonal_win, true},
                 end_game_conditions:is_game_over([o,2,x,4,o,6,x,x,o]))
  },
  {"it will return false if there is not a backward diagonal win",
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over([x,2,x,4,5,6,7,o,o])),
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over([1,o,o,4,x,6,7,x,x]))
  }].
