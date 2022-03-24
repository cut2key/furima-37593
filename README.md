# テーブル設計

## users table

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               | 
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item-name        | string     | null: false                    |
| item-description | text       | null: false                    |
| item-detail      | string     | null: false                    |
| shipment         | string     | null: false                    |
| price            | string     | null: false                    |
| user_id          | reference  | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :users

## purchase table

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| cc-info   | text       | null: false                    |
| items_id  | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :address

## address table

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| ship-address   | text       | null: false                    |
| purchase_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase