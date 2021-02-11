# テーブル設計

## usersテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_ruby  | string  | null: false |
| first_name_ruby | string  | null: false |
| birth_year      | integer | null: false |
| birth_month     | integer | null: false |
| birth_day       | integer | null: false |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| description          | text       | null: false                    |
| category             | string     | null: false                    |
| state                | string     | null: false                    |
| shipping_cost_payer  | string     | null: false                    |
| shipping_source_area | string     | null: false                    |
| shipping_day         | string     | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :purchases

## purchasesテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| address_number | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | integer    | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association
- has_one :purchase