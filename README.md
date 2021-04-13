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

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |


### Association
- has_many :animals
- has_many :orders
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages
- has_one  :details


## details テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
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
| tel                | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association
- belongs_to :user


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