# furimaのDB設計

## usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| dob_id          | date   | null: false |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ------------------|
| user             | references | foreign_key: true |
| name             | string     | null: false       |
| text             | text       | null: false       |
| category_id      | integer    | null: false       |
| status_id        | integer    | null: false       |
| shipping_fee_id  | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| shipment_date_id | integer    | null: false       |
| price            | integer    | null: false       |

### Association
- belongs_to :user
- has_one :purchase



## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address



## addresses
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| purchase      | references | null: false, foreign_key: true |
| postal_code   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| apartment     | string     | null: false                    |
| phone_number  | integer    | null: false                    |

### Association
- belongs_to :purchase