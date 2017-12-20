#! /bin/bash

export PATH=$PATH:~/n/bin/

if [ "$DEPLOY" = "true"  ]; then
  cd /usr/local/src/red &&\
    yes | mix deps.get --force &&\
    mix ecto.migrate &&\
    cd assets && npm install
fi

cd /usr/local/src/red &&\
  mix local.hex --force &&\
  mix phx.server

/bin/bash
