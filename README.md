# Erlang Tic-Tac-Toe

## Setup
The following assumes you are using Mac OS X

+ Install Homebrew `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
+ Install Erlang/OTP 21 `brew install erlang@21`
+ Install Rebar3 `brew install rebar3`

## Build 
+ Clone the repository `git clone https://github.com/ericdrosado/erlang-ttt`
+ Change directories into the root directory `cd erlang-ttt/erlang_ttt`
+ To build `rebar3 compile`

## Run Game
While in the root directory:
`erl -noshell -pa _build/default/lib/erlang_ttt/ebin/ -run erlang_ttt run`

## Exit Game
While, running the game:
`ctrl-c` twice

## Run Tests
While in the root directory:
`rebar3 eunit`

## Run Linter
While in the root directory:
`rebar3 as lint lint`