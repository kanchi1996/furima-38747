# README
##users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birth_day          | string | null: false |
| first name         | string | null: false |
| family name        | string | null: false |
| first name_kana    | string | null: false |
| family name_kana   | string | null: false |


##items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    | 
| condition_id     | integer    | null: false                    |
| prefecture_id    | integer	  |null: false                     |
| transport_day_id | integer  	|null: false                     |

##commentsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| items_id  | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

##shopping addressテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | integer    | null: false                    |
| prefecture_id    | string     | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |    
| building_name    | string     |                                |
| telephone_number | integer    | null: false                    |
| order            | references	| null: false, foreign_key: true |


##oderテーブル

| Column           | Type       | Options                        |
| ---------------  | ---------- | ------------------------------ |
| user_id          | string     | null: false                    |
| item_id          | text       | null: false                    |


##imagesテーブル

| Column    | Type       | Options       |
| ----------| ---------- | --------------|
| url       | string     | null: false   |
| item_id   | references | null: false   |
