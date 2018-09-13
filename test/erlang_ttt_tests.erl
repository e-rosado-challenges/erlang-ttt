-module(erlang_ttt_tests).
-include_lib("eunit/include/eunit.hrl").

return_hello_world_test() -> 
  {"it will return 'Hello World!'",
  ?assertEqual("Hello World!", erlang_ttt:run())
  }.