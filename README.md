# README
# テーブル設計

## usersテーブル

| Column     |  Type   |  Options     |
| --------   |  ------ |  ----------- |
| nickname   |  string |  null: false |
| email      |  string |  null: false |
| pass       |  string |  null: false |
| name       |  string |  null: false |
| name_kana  |  string |  null: false |
| birth      |  string |  null: false |

### Association

- has_many :items
- has_many :comments 
- has_many :addresses
- has_many :purchases

##  itemsテーブル

| Column    |  Type       |  Options       |
| --------- |  ---------- |  ------------  |
| name      |  string     |  null: false   |
| info      |  text       |  null: false   |
| category  |  string     |  null: false   |
| sales     |  string     |  null: false   |
| shipping  |  string     |  null: false   |
| prefecture|  string     |  null: false   |
| scheduled |  string     |  null: false   |
| price     |  string     |  null: false   |
| content   |  string     |  null: false   |
| fee       |  string     |  null: false   |
| profit    |  string     |  null: false   |
| image     |             |  ActiveStorage |
| user      |  references | null: false, foreign_key: true|

### Association

- belongs_to  :user
- has_many    :comments
- has_many    :purchases

## purchasesテーブル

| Column      |  Type       |  Options    |
| ---------   |  ---------- |  ---------- |
| number      |  string     |  null: false|
| exp         |  string     |  null: false|
| cvc         |  string     |  null: false|
| user        |  references |  null: false, foreign_key: true|
| item        |  references |  null: false, foreign_key: true|
| address     |  references | null: false, foreign_key: true |


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

| Column    |  Type       |  Options    |
| --------- |  ---------- |  ---------- |
| address   |  text       | null: false |
| user      |  references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchase

