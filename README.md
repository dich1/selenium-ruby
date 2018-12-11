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
docker-compose run --rm -e DISPLAY=MACのIP(ifconfigのinet 192.168.～):0 app ruby /selenium_ruby/app/tests.rb
```

MAC側にGUI表示しない場合(本番など)は下記のように対応して再作成して利用
- コメントアウトを外す。
https://github.com/dich1/selenium_ruby/blob/3a5e8748d3061054d3caddaecfcbdea70204c6f2/app/Dockerfile#L80-L81
- コメントアウトをする。
https://github.com/dich1/selenium_ruby/blob/3a5e8748d3061054d3caddaecfcbdea70204c6f2/app/Dockerfile#L83
