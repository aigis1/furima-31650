# テーブル設計

## users テーブル

| column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_date      | date   | null: false |

## Association

- has_many :items
- has_many :orders
<!-- - has_many :comments -->

## items テーブル

| column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| info                  | text       | null: false                    |
| price                 | integer    | null: false                    |
| category_id           | integer    | null: false                    |
| sales_status_id       | integer    | null: false                    |
| shipping_fee_id       | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| scheduled_delivery_id | integer    | null: false                    |
| user                  | reference  | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :order
<!-- - has_many :comments -->

## Address テーブル

| column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| postal_code     | string    | null: false                    |
| prefecture_id   | integer   | null: false                    |
| city            | string    | null: false                    |
| house_number    | string    | null: false                    |
| building        | string    |                                |
| telephone       | string    | null: false                    |
| order           | reference | null: false, foreign_key: true |

## Association

- belong_to :order

## Orders テーブル

| column  | Type      | Options                        |
| ------- | ------    | ------------------------------ |
| user    | reference | null: false, foreign_key: true |
| item    | reference | null: false, foreign_key: true |
| address | reference | null: false, foreign_key: true |

## Association

- has_one :address
- belongs_to :user
- belongs_to :item

<!-- ## Comments テーブル

| Column  | type      | Options                        |
| ------- | --------- | ------------------------------ |
| comment | text      | null: false                    |
| user_id | reference | null: false, foreign_key: true |
| item_id | reference | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item -->