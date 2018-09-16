-module(end_game_conditions).
-export([is_tie_game/1]).

is_tie_game([]) -> true;
is_tie_game([Space|_Spaces]) when is_integer(Space) -> false;
is_tie_game([_Space|Spaces]) -> is_tie_game(Spaces).