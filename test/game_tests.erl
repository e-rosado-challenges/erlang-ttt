-module(game_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [get_player_move_test/0, get_computer_move_test/0,
          play_game_test/0]}).

get_player_move_test() ->
  {"it will return an updated board with player move",
    ?assertEqual([1,"X",3,4,5,6,7,8,9], 
                  game:get_player_move(_Board = [1,2,3,4,5,6,7,8,9],
                                       _View = mock_io_handler))
  }.

get_computer_move_test() ->
  {"it will return an updated board with computer move",
    ?assertEqual(["O","X",3,4,5,6,7,8,9],
                  game:get_computer_move(_Board = [1,"X",3,4,5,6,7,8,9],
                                         _Marker = "O"))
  }.

play_game_test() ->
  {"it will return 'O wins Prompt'",
    ?assertEqual("O Wins!",
                  game:play_game(_Board = [1,2,3,4,5,6,7,8,9],
                                 _View = mock_io_handler,
                                 _GameOver = end_game_conditions:is_game_over(
                                              [1,2,3,4,5,6,7,8,9]
                                             )
                                ))
  }.