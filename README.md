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

| column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| name    | string    | null: false                    |
| info    | text      | null: false                    |
| price   | integer   | null: false                    |
| user_id | reference | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :order
<!-- - has_many :comments -->

## Order テーブル

| column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| postal_code  | integer   | null: false                    |
| prefecture   | integer   | null: false                    |
| city         | string    | null: false                    |
| house_number | string    | null: false                    |
| building     | string    |                                |
| telephone    | integer   | null: false                    |
| user_id      | reference | null: false, foreign_key: true |
| item_id      | reference | null: false, foreign_key: true |

## Association

- belongs_to :user
- belong_to :item

<!-- ## Comments テーブル

| Column  | type      | Options                        |
| ------- | --------- | ------------------------------ |
| comment | text      | null: false                    |
| user_id | reference | null: false, foreign_key: true |
| item_id | reference | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item -->