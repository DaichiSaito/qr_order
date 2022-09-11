```
$ docker-compose build --no-cache
$ docker-compose run --rm web bin/setup
$ docker-compose up  
```

以下にアクセスする。

http://localhost:3000/admin/order_units

Basic認証が求められる画面に遷移できればOK。

なお、QRコードをスマホで読み込んで動作確認する場合はngrokを使ってサーバを公開する必要がある。

```
$ ngrok http 3000 
```

これで表示されたドメインを `config/environments/development.rb`の以下部分に設定。その上で`docker-compose restart web`を実行して反映。
```rb
config.hosts << "xxxxxxxxxxxxxxxxxxx.ngrok.io" 
```
