#!/bin/sh
# docker-compose.ymlから呼び出される、rails serverを起動するためのシェルスクリプト

yarn check;
if ! $? = 0 ; then
  yarn install;
fi

bundle install; # Gemfileの更新をチェック
rm -f /app/tmp/pids/server.pid; # 古いpidファイルを削除

bin/webpack-dev-server & rails server -b 0.0.0.0 -p 3000
