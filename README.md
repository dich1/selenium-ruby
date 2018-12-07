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
1. appコンテナのIDを確認
docker ps
2. プロジェクトのルートに移動し、コンテナを起動
docker-compose up -d
3. テストスクリプトを実行
docker run --rm -e DISPLAY=MACのIP:0 -it appのイメージ ruby /selenium_ruby/app/tests.rb
4. キャプチャが撮れている事を確認
screenshot.png
```