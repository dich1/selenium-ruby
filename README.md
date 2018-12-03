# selenium-ruby
## 環境構築
1. Docker for macを入れ、Dockerを起動する
2. ボリュームを作成する
docker volume create --name=mysql-data
3. プロジェクトのルートに移動する
4. イメージを作成、コンテナを起動する
docker-compose up -d
5. 動作確認
```
appコンテナのIDを確認
docker ps
コンテナにログイン
docker exec -it appコンテナのID /bin/bash
テストスクリプトを実行
ruby /ruby_selenium/app/tests.rb
キャプチャが撮れている事を確認
screenshot.png
```