# selenium-ruby
## 環境構築
1. Docker for macを入れ、Dockerを起動する
2. ボリュームを作成する
```
docker volume create --name=mysql-data
```
3. プロジェクトのルートに移動する
4. イメージを作成、コンテナを起動する
```
docker-compose up -d
```
5. 動作確認
ローカルからのGUI起動確認設定
```
別タブのターミナルを開く
プロジェクトのルートに移動
chmod + x local-setup.sh
./local-setup.sh
XQuartzが開き、socatが起動中になっていることを確認
```
テストスクリプトの実行
```
元のターミナル
1. appのイメージ名を確認
docker images
2. テストスクリプトを実行
docker run --rm -e DISPLAY=MACのIP:0 -it appのイメージ名 ruby /selenium_ruby/app/tests.rb
3. ブラウザキャプチャが撮れている事を確認
screenshot.png
```