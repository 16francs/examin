CLIENT_REPO=./containers/client
API_REPO=./containers/api
CLIENT=cd $(CLIENT_REPO)
API=cd $(API_REPO)

# 環境構築
setup:
	cp .env.sample .env
	cp ./env/api.env.sample ./env/api.env
	cp ./env/client.env.sample ./env/client.env
	$(CLIENT); git init
	$(CLIENT); git remote add origin https://github.com/16francs/examin_vue.git
	$(CLIENT); git pull origin master
	$(API); git init
	$(API); git remote add origin https://github.com/16francs/examin_rails.git
	$(API); git pull origin master

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
	docker-compose run --rm client yarn test
	docker-compose run --rm api bundle exec rails rspec spec
##########

### 本番環境 ###
# ビルド
build:
	docker-compose -f docker-compose.production.yml build

# コンテナを起動
start:
	docker-compose -f docker-compose.production.yml up -d

# コンテナを停止
stop:
	docker-compose -f docker-compose.production.yml stop

# ログの閲覧
logs:
	docker-compose -f docker-compose.production.yml logs
##########
