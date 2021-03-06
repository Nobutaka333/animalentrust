# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

| 概要                                            | 詳細                     |
| ----------------------------------------------- | ------------------------ |
| アプリケーション名                              | animalentrust |
| アプリケーション概要                            | ペットの個人一時預かりサービス| 
| テスト用アカウント	                            |  |
| 利用方法        	                              | ユーザー登録を行った後、募集や応募が可能|
| 目指した課題解決	                              | 用事（冠婚葬祭）や旅行などで家を空けなければならないが、飼っているペットが心配。金銭的にもあまり余裕がなく、できるだけ安価に抑えたい人に対してペットを一時的に無償で預かってもいい人とマッチングができる。|
| 洗い出した要件                               	  | ユーザー管理機能  募集機能  募集一覧表示機能  募集詳細表示機能  募集情報編集機能  募集削除機能  応募機能  チャットルーム作成機能  メッセージ投稿機能  メッセージ削除機能  募集検索|
| 実装した機能についての画像やGIFおよびその説明	  |  |
| 実装予定の機能	                                |  |
| データベース設計（ER図）	                      |[ER図](https://gyazo.com/f7d551ef30b2a6a59b95ece1ae061405)|
| ローカルでの動作方法	                          | 次のコマンドを順に実行% bundle install  % yarn install  % rails db:create  % rails db:migrate  rubyバージョン2.6.5  |


# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| nickname           | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| user_birthday      | date       | null: false                    |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| buliding_name      | string     |                                |
| tel                | string     | null: false                    |

### Association
- has_many :animals
- has_many :orders
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages


## animals テーブル

| Column               | Type       | Options                        |
| -------------------- | -----------| ------------------------------ |
| name                 | string     | null: false                    |
| text                 | text       | null: false                    |
| category_id          | integer    | null: false                    |
| storage_place_pet_id | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| animal_erea          | string     | null: false                    |
| storage_time         | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :user
- has_many :rooms

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| animal    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :animal

## rooms テーブル

| Column   | Type       | Options                        |
| -------- | ------     | ------------------------------ |
| name     | string     | null: false                    |
| animal   | references | null: false, foreign_key: true |

### Association
- has_many :room_users
- has_many :users, through: room_users
- has_many :messages
- belongs_to :animal

## room_users テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

- belongs_to :room
- belongs_to :user