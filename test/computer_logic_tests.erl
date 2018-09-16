-module(computer_logic_tests).
-include_lib("eunit/include/eunit.hrl").
-compile({nowarn_unused_function, [get_available_spaces_test/0]}).

get_available_spaces_test() ->
  {"it will return available spaces when given a Board.",
    ?assertEqual([2,3,4,5,6,7,8,9],
                 computer_logic:get_available_spaces([x,2,3,4,5,6,7,8,9], [])),
    ?assertEqual([2,3,5,6,8,9],
                 computer_logic:get_available_spaces([x,2,3,o,5,6,x,8,9], []))
  }.
