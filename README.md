# README
# テーブル設計

## usersテーブル

| Column     |  Type   |  Options     |
| --------   |  ------ |  ----------- |
| nickname   |  string |  null: false |
| email      |  string |  null: false, unique: true |
| encrypted_password       |  string |  null: false |
| last_name       |  string |  null: false |
| first_name      |  string |  null: false |
| last_name_kana  |  string |  null: false |
| first_name_kana |  string |  null: false |
| birth      |  date   |  null: false |

### Association

- has_many :items
- has_many :comments 
- has_many :purchases

##  itemsテーブル

| Column    |  Type       |  Options       |
| --------- |  ---------- |  ------------  |
| name      |  string     |  null: false   |
| info      |  text       |  null: false   |
| price     |  integer    |  null: false   |
| sales_id     |  integer    | null: false, active_hash   |
| shipping_id  |  integer    | null: false, active_hash   |
| prefecture_id|  integer    | null: false, active_hash   |
| scheduled_id |  integer    | null: false, active_hash   |
| category_id  |  integer    | null: false, active_hash   |
| user      |  references | null: false, foreign_key: true|


### Association

- belongs_to  :user
- has_many    :comments
- has_one    :purchase

## purchasesテーブル

| Column      |  Type       |  Options    |
| ---------   |  ---------- |  ---------- |
| user        |  references |  null: false, foreign_key: true|
| item        |  references |  null: false, foreign_key: true|



### Association

- belongs_to :item
- belongs_to :user
- has_one    :address


## commentsテーブル

| Column    |  Type       |  Options    |
| --------- |  ---------- |  ---------- |
| text      |  text       | null: false |
| user      |  references | null: false, foreign_key: true |
| item      |  references | null: false, foreign_key: true |


### Association

- belongs_to  :user
- belongs_to  :item


## addressesテーブル

| Column     |  Type       |  Options    |
| ---------  |  ---------- |  ---------- |
| postal_code|  integer    | null: false |
| prefecture_id|  integer  | null: false |
| city       |  string     | null: false |
| address    |  string     | null: false |
| building   |  string     |             | 
| phone_number| integer    | null: false |
| user       |  references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

