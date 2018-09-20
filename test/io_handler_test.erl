-module(io_handler_test).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [request_space_test/0]}).

request_space_test() ->
  [{"it will return the user move if it is an integer and is an available space.",
    ?assertEqual(1, io_handler:request_space(_AvailableSpaces = [1,2,3],
                                             _InputStatus = {ok,["1"]},
                                             _CatchFunction = io_handler:invalid_entry()))
  },
  {"it will return invalid_entry if the user move is not available",
    ?assertEqual(io_handler:invalid_entry(), 
                 io_handler:request_space(_AvailableSpaces = [1,2,3],
                                          _InputStatus = {ok,["4"]},
                                          _CatchFunction = io_handler:invalid_entry()))
  },
  {"it will return invalid_entry if the user input is not an integer",
    ?assertEqual(io_handler:invalid_entry(),
                 io_handler:request_space(_AvailableSpaces = [1,2,3],
                                          _InputStatus = {ok,["Hello"]},
                                          _CatchFunction = io_handler:invalid_entry()))
  }].