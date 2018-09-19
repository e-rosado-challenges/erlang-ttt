-module(computer_logic_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [make_best_move_test/0]}).

make_best_move_test() ->
  [{"it will block a horizontal win",
    ?assertEqual(["X","X","O",4,5,6,7,"O",9],
                  computer_logic:make_best_move(_Board = ["X","X",3,4,5,6,7,"O",9],
                                               _Marker = "O"))
  },
  {"it will block a vertical win",
    ?assertEqual(["X",2,3,"X",5,6,"O","O",9],
                  computer_logic:make_best_move(_Board = ["X",2,3,"X",5,6,7,"O",9],
                                               _Marker = "O"))
  },
  {"it will block a forward diagonal win",
    ?assertEqual([1,2,"O",4,"X",6,"X","O",9],
                  computer_logic:make_best_move(_Board = [1,2,3,4,"X",6,"X","O",9],
                                               _Marker = "O"))
  },
  {"it will block a backwards diagonal win",
    ?assertEqual(["O",2,3,4,"X",6,7,"O","X"],
                  computer_logic:make_best_move(_Board = [1,2,3,4,"X",6,7,"O","X"],
                                               _Marker = "O"))
  },
  {"it will take the horizontal win",
    ?assertEqual(["O","O","O",4,"X",6,"X","X",9],
                  computer_logic:make_best_move(_Board = ["O",2,"O",4,"X",6,"X","X",9],
                                               _Marker = "O"))
  },
  {"it will take the vertical win",
    ?assertEqual(["O",2,3,"O","X","X","O","X",9],
                  computer_logic:make_best_move(_Board = ["O",2,3,"O","X","X",7,"X",9],
                                               _Marker = "O"))
  },
  {"it will take the forward diagonal win",
    ?assertEqual(["X","X","O","X","O",6,"O","X",9],
                  computer_logic:make_best_move(_Board = ["X","X","O","X","O",6,7,"X",9],
                                               _Marker = "O"))
  },
  {"it will take the backwards diagonal win",
    ?assertEqual(["O","X",3,"X","O",6,"X",8,"O"],
                  computer_logic:make_best_move(_Board = ["O","X",3,"X","O",6,"X",8,9],
                                               _Marker = "O"))
  }].