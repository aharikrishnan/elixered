#! /bin/bash

export PATH=$PATH:~/n/bin/
export APP=/usr/local/src/red

if [ "$DEPLOY" = "true"  ]; then
  cd $APP &&\
    yes | mix deps.get --force &&\
    mix ecto.migrate &&\
    cd assets && npm install
fi

cd $APP &&\
  mix local.hex --force

cd $APP/assets &&\
  npm install &&\
  ./node_modules/brunch/bin/brunch build &&\
  ./node_modules/brunch/bin/brunch watch&

cd $APP &&\
  mix phx.server

/bin/bash
