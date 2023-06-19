# README
##users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false、unique: true |
| encrypted_password | string | null: false |
| birth_day          | date   | null: false |
| first name         | string | null: false |
| family name        | string | null: false |
| first name_kana    | string | null: false |
| family name_kana   | string | null: false |

## Association
- has_many :items
- has_many :orders

##items テーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| title              | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    | 
| condition_id       | integer    | null: false                    |
| prefecture_id      | integer	  |null: false                     |
| transport_day_id   | integer  	|null: false                     |
| delivery_charge_id |integer  	  |null: false                     |

## Association
- has_one :order
- belongs_to :user

##shopping addressテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | string     | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |    
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| order            | references	| null: false, foreign_key: true |

## Association
- belongs_to :order

##ordersテーブル

| Column           | Type       | Options                        |
| ---------------  | ---------- | ------------------------------ |
| user_id          | string     | null: false                    |
| item_id          | text       | null: false                    |

## Association
- belongs_to :user
- belongs_to :item
- has_one :shipping
