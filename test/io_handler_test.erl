-module(io_handler_test).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [request_space_test/0]}).

request_space_test() ->
  {"it will return the user input if it is an integer",
    ?assertEqual(1, io_handler:request_space(_InputStatus = {ok,["1"]},
                                             _CatchFunction = io_handler:invalid_entry()))
  },
  {"it will not return the user input if it is not an integer",
    ?assertEqual(io_handler:invalid_entry(), 
                 io_handler:request_space(_InputStatus = {ok,["Hello"]},
                                          _CatchFunction = io_handler:invalid_entry()))
  }.