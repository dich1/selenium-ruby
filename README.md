# selenium-ruby
## 環境構築
1. Docker for macを入れ、Dockerを起動する
https://download.docker.com/mac/stable/Docker.dmg

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
```
docker-compose exec app bash
cd /selenium_ruby/app
ruby tests.rb '埼玉県' > result.txt
```