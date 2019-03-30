# Examin

## 初期設定

* プロジェクトをクローンする

> git clone https://github.com/16francs/examin.git

* 環境構築を行う

> make setup

環境構築には，
clientに[examin_vue](https://github.com/16francs/examin_vue)を，
apiに[examin_rails](https://github.com/16francs/examin_rails)を使用

## 開発環境

* コンテナをビルド

> make dev-build

* コンテナの起動

> make dev-start

* コンテナの停止

> make dev-stop

* テストの事項

> make test

## 本番環境

* コンテナをビルド

> make build

* コンテナの起動

> make start

* コンテナの停止

> make stop

* ログの閲覧

> make logs
