-module(io_handler_test).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [request_space_test/0]}).

request_space_test() ->
  [{"it will return the user move if it is an integer and is an available space.",
    ?assertEqual(1, io_handler:request_space(_View = win_mock_io_handler,
                                             _AvailableSpaces = [1,2,3],
                                             _InputStatus = {ok,["1"]}))
  },
  {"it will return a second choice move if the user move is not available",
    ?assertEqual(2, 
                 io_handler:request_space(_View = win_mock_io_handler,
                                          _AvailableSpaces = [1,2,3],
                                          _InputStatus = {ok,["4"]}))
  },
  {"it will return a second choice move if the user input is not an integer",
    ?assertEqual(2,
                 io_handler:request_space(_View = win_mock_io_handler,
                                          _AvailableSpaces = [1,2,3],
                                          _InputStatus = {ok,["Hello"]}))
  }].