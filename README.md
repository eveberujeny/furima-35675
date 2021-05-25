# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| name_reading       | string  | null: false |
| surname_reading    | string  | null: false |
| nickname           | string  | null: false |
| email              | string  | unique: true|
| encrypted_password | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| description    | text       | null: false                    |
| price          | integer    | null: false                    |
| category_id    | integer    | null: false                    |
| status_id      | integer    | null: false                    |
| burden_id      | integer    | null: false                    |
| source_id      | integer    | null: false                    |
| days_id        | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyers

## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresses

## addresses テーブル

| Colum         | Type       | Option           |
| ------------- | ---------- | ---------------- |
| postal_code   | string     | null: false      |
| prefecture_id | integer    | null: false      |
| city          | string     | null: false      |
| house_number  | string     | null: false      |
| building_name | string     |                  |
| phone_number  | string     | null: false      |

### Association

- belongs_to :buyer