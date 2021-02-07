# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |
### Association

- has_many :purchases
- has_many :items

## items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| detail           | text       | null: false       |
| category_id      | integer    | null: false       |
| status_id        | integer    | null: false       |
| delivery_fee_id  | integer    | null: false       |
| deliver_area_id  | integer    | null: false       |
| delivery_date_id | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key :true |

### Association

- belongs_to :user
- has_one    :purchase

## purchases テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| user            | references | foreign_key :true |
| item            | references | foreign_key :true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :post


## posts テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | integer    | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| number        | string     | null: false       |
| building      | string     | ----------------- |
| tel_number    | string     | null: false       |
| purchase      | references | foreign_key :true |


### Association

- belongs_to :purchase