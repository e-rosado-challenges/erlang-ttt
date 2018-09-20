-module(game_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [get_player_move_test/0]}).

get_player_move_test() ->
  FirstMove = 2,
  {"it will return a player move",
    ?assertEqual(FirstMove, game:get_player_move(_Board = [1,2,3,4,5,6,7,8,9],
                                                 _View = mock_io_handler))
  }.