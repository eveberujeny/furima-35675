# テーブル設計

## users テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| name         | string  | null: false |
| name_reading | string  | null: false |
| nickname     | string  | null: false |
| email        | string  | null: false |
| password     | string  | null: false |
| birthday     | integer | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| textarea | text       | null: false                    |
| price    | integer    | null: false                    |
| category | integer    | null: false                    |
| delivery | integer    | null: false                    |
| user_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyers

## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
