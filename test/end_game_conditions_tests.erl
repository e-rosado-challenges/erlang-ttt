-module(end_game_conditions_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [is_game_over_test/0]}).

is_game_over_test() -> 
  [{"it will return true if there is a horizontal win",
    ?assertEqual({horizontal_win, true},
                 end_game_conditions:is_game_over(["X","X","X",4,5,6,7,"O","O"])),
    ?assertEqual({horizontal_win, true},
                 end_game_conditions:is_game_over([1,"X",3,"O","O","O",7,"X","X"]))
  },
  {"it will return false if there is not a horizontal win",
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over(["X",2,"X",4,5,6,7,"O","O"])),
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over([1,"O","O",4,"X",6,7,"X","X"]))
  },
  {"it will return true if there is a vertical win",
    ?assertEqual({vertical_win, true},
                 end_game_conditions:is_game_over(["X",2,3,"X",5,6,"X","O","O"])),
    ?assertEqual({vertical_win, true},
                 end_game_conditions:is_game_over(["X","O",3,"X","O",6,7,"O","X"]))
  },
  {"it will return false if there is not a vertical win",
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over(["X",2,"X",4,5,6,7,"O","O"])),
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over([1,"O","O",4,"X",6,7,"X","X"]))
  },
  {"it will return true if there is a forward diagonal win",
    ?assertEqual({forward_diagonal_win, true},
                 end_game_conditions:is_game_over([1,2,"X",4,"X",6,"X","O","O"])),
    ?assertEqual({forward_diagonal_win, true},
                 end_game_conditions:is_game_over(["X",2,"O",4,"O",6,"O","X","X"]))
  },
  {"it will return false if there is not a forward diagonal win",
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over(["X",2,"X",4,5,6,7,"O","O"])),
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over([1,"O","O",4,"X",6,7,"X","X"]))
  },
  {"it will return true if there is a backward diagonal win",
    ?assertEqual({backward_diagonal_win, true},
                 end_game_conditions:is_game_over(["X",2,3,4,"X",6,"O","O","X"])),
    ?assertEqual({backward_diagonal_win, true},
                 end_game_conditions:is_game_over(["O",2,"X",4,"O",6,"X","X","O"]))
  },
  {"it will return false if there is not a backward diagonal win",
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over(["X",2,"X",4,5,6,7,"O","O"])),
    ?assertEqual({no_winner, false},
                 end_game_conditions:is_game_over([1,"O","O",4,"X",6,7,"X","X"]))
  }].
