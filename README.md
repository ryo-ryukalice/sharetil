# sharetil

## 環境構築(docker)

```
$ docker-compose build
$ docker-compose up

# DBのセットアップ
$ docker-compose exec app bash -c "rails db:create && rails db:migrate && rails db:seed"  

# ブラウザでアクセス
http://localhost:3000

# rails consoleやrspecを実行したい場合、appコンテナの中に入る
$ docker-compose exec app bash
$ rails c
```
