-module(computer_logic_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [make_best_move_test/0]}).

make_best_move_test() ->
  [{"it will block a horizontal win",
    ?assertEqual([x,x,o,4,5,6,7,o,9],
                  computer_logic:make_best_move(_Board = [x,x,3,4,5,6,7,o,9],
                                               _Marker = o))
  },
  {"it will block a vertical win",
    ?assertEqual([x,2,3,x,5,6,o,o,9],
                  computer_logic:make_best_move(_Board = [x,2,3,x,5,6,7,o,9],
                                               _Marker = o))
  },
  {"it will block a forward diagonal win",
    ?assertEqual([1,2,o,4,x,6,x,o,9],
                  computer_logic:make_best_move(_Board = [1,2,3,4,x,6,x,o,9],
                                               _Marker = o))
  },
  {"it will block a backwards diagonal win",
    ?assertEqual([o,2,3,4,x,6,7,o,x],
                  computer_logic:make_best_move(_Board = [1,2,3,4,x,6,7,o,x],
                                               _Marker = o))
  },
  {"it will take the horizontal win",
    ?assertEqual([o,o,o,4,x,6,x,x,9],
                  computer_logic:make_best_move(_Board = [o,2,o,4,x,6,x,x,9],
                                               _Marker = o))
  },
  {"it will take the vertical win",
    ?assertEqual([o,2,3,o,x,x,o,x,9],
                  computer_logic:make_best_move(_Board = [o,2,3,o,x,x,7,x,9],
                                               _Marker = o))
  },
  {"it will take the forward diagonal win",
    ?assertEqual([x,x,o,x,o,6,o,x,9],
                  computer_logic:make_best_move(_Board = [x,x,o,x,o,6,7,x,9],
                                               _Marker = o))
  },
  {"it will take the backwards diagonal win",
    ?assertEqual([o,x,3,x,o,6,x,8,o],
                  computer_logic:make_best_move(_Board = [o,x,3,x,o,6,x,8,9],
                                               _Marker = o))
  }].