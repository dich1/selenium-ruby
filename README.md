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
初期設定
```
Homebrewを入れる
brew install socat
brew tap caskroom/cask
brew cask install xquartz
```
スクリプトGUI確認準備
```
別タブのターミナルを開いて下記を実行
open -a XQuartz
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
XQuartzが開き、socatが起動中になっていることを確認
```
スクリプトの実行
```
元のターミナル
appのイメージ名を確認
docker images
テストスクリプトを実行
docker run --rm -e DISPLAY=MACのIP:0 -it appのイメージ名 ruby /selenium_ruby/app/tests.rb
ブラウザキャプチャが撮れている事を確認(screenshot.png)
```