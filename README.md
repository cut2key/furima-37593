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
| country_id       | integer    | null: false                    |
| ship_day_id      | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchases table

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses table

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| zip_code       | string     | null: false                    |
| country_id     | integer    | null: false                    |
| city           | string     | null: false                    |
| st_address     | string     | null: false                    |
| building       | string     |                                |
| phone_num      | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase