# 環境構築
setup:
	echo "create env file"
	cp .env.sample .env
	cp ./env/api.env.sample ./env/api.env
	cp ./env/client.env.sample ./env/client.env
	echo "clone client project -> examin_vue"
	cd ./containers/client
	git init
	git remote add origin https://github.com/16francs/examin_vue.git
	git pull origin master
	cd ../../
	echo "clone api project -> examin_rails"
	cd ./containers/api
	git init
	git remote add origin https://github.com/16francs/examin_rails.git
	git pull origin master
	cd ../../

### 開発環境 ###
# ビルド
dev-build:
	docker-compose build

# コンテナを起動
dev-start:
	docker-compose up -d

# コンテナを停止
dev-stop:
	docker-compose stop

# テストの実行
test:
	echo "client test"
	docker-compose run --rm client yarn test
	echo "api test"
	docker-compose run --rm api bundle exec rails rspec spec
##########

### 本番環境 ###
# ビルド
build:
	docker-compose build -f docker-compose.production.yml

# コンテナを起動
start:
	docker-compose up -d -f docker-compose.production.yml

# コンテナを停止
stop:
	docker-compose stop -f docker-compose.production.yml

# ログの取得
log:
	docker-compose logs -f
##########
