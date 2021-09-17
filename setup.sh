#!/bin/sh
cd /app

echo "Getting deps"
yes | mix deps.get

echo "Fancy compile"
elixir $CMD_OPTS -pa _build/prod/consolidated -S mix compile

# echo "Compiling deps"
yes | mix deps.compile
echo "Compiling app"
yes | mix compile

echo "Compiling protocols"
mix compile.protocols

echo "Done setting up"
