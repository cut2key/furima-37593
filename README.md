# テーブル設計

## users table

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               | 
| first_name         | string | null: false               | 
| last_kana          | string | null: false               | 
| first_kana         | string | null: false               | 
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| item_description | text       | null: false                    |
| category_id      | integer    | null: false                    |
| quality_id       | integer    | null: false                    |
| ship_fee_id      | integer    | null: false                    |
| ship_area_id     | integer    | null: false                    |
| ship_day_id      | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchase table

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| items     | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address table

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| zip_code       | integer    | null: false                    |
| country_id     | integer    | null: false                    |
| city           | string     | null: false                    |
| st_address     | string     | null: false                    |
| building       | string     | null: false                    |
| phone_num      | integer    | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase