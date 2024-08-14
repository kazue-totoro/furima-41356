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

## usersテーブル

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| nickname           | string | null: false | 
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |


### Associations

has_many :items
has_many :comments
has_many :orders


## itemsテーブル

| Column             | Type    | Options     |
|--------------------|---------|-------------|
| name               | string  | null: false |
| item_details       | text    | null: false |
| category_id        | integer | null: false |
| condition_id       | integer | null: false |
| shipping_fee_id    | integer | null: false |
| prefecture_id      | integer | null: false |
| shipping_date_id   | integer | null: false |
| price              | integer | null: false |
| user               | reference | null: false, foreign_key: true |

### Associations

belongs_to :user
has_many :comments
has_one :order


## commentsテーブル

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| content            | text   | null: false |
| user               | reference | null: false, foreign_key: true |
| item               | reference | null: false, foreign_key: true |

### Associations

belongs_to :user
belongs_to :item


## ordersテーブル

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| user               | reference | null: false, foreign_key: true |
| item               | reference | null: false, foreign_key: true |


### Associations

belongs_to :user
belongs_to :item
has_one :address



## addressテーブル

| Column             | Type    | Options     |
|--------------------|---------|-------------|
| post_code          | string  | null: false |
| prefecture_id      | integer | null: false |
| city               | string  | null: false |
| block              | string  | null: false |
| building           | string  |             |
| phone_number       | string  | null: false |
| order              | reference | null: false, foreign_key: true |

### Associations

belongs_to :order

