-module(game_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [initialize_game_test/0]}).

initialize_game_test() ->
  [{"it will return 'O Wins!' prompt",
    ?assertEqual("O Wins!",
                 game:initialize_game(_View = win_mock_io_handler))
  },
  {"it will return 'Tie Game!' prompt",
    ?assertEqual("Tie Game!",
                 game:initialize_game(_View = tie_mock_io_handler))
  }].