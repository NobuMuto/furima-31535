# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| birthday   | integer| null: false |
### Association

- has_many :purchases
- has_many :items, through: purchases
- has_many :items
- has_one  :post

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| detail        | text       | null: false |
| categoly      | string     | null: false |
| status        | string     | null: false |
| delivery_fee  | integer    | null: false |
| deliver_area  | string     | null: false |
| delivery_date | integer    | null: false |
| price         | integer    | null: false |
| user          | references | ----------- |

### Association

- belongs_to :users
- has_many   :purchases
- has_many   :users, through: purchases
- has_one    :post

## purchases テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| card_number     | integer    | null: false |
| expiration_date | integer    | null: false |
| security_code   | string     | null: false |
| user            | references | ----------- |
| item            | references | ----------- |

### Association

- belongs_to :user
- belongs_to :prototype
- has_one    :post


## posts テーブル

| Column      | Type       | Options     |
| ----------  | ---------- | ----------- |
| postal_code | integer    | null: false |
| prefecture  | string     | null: false |
| city        | string     | null: false |
| number      | integer    | null: false |
| building    | string     | null: false |
| tel_number  | integer    | null: false |
| user        | references | ----------- |
| item        | references | ----------- |
| purchase    | references | ----------- |


### Association

- belongs_to :purchases
- belongs_to :user
- belongs_to :item