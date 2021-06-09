# README
# テーブル設計
## Users
|Column            |Type  |Option                  |
|------------------|------|------------------------|
|nickname          |string|null,false              |
|email             |string|null,false, unique: true|
|encrypted_password|string|null,false              |
|last_name         |string|null,false              |
|first_name        |string|null,false              |
|last_name_kana    |string|null,false              |
|first_name_kana   |string|null,false              |
|birth_date        |date  |null,false              |
### Assosiation
- has_many :Items
- has_many :Shippings
## Items
|Column           |Type      |Option                       |
|-----------------|----------|-----------------------------|
|name             |string    |null,false                   |
|info             |text      |null,false                   |
|category         |integer   |null,false                   |
|status           |integer   |null,false                   |
|fee_status       |integer   |null,false                   |
|prefecture       |integer   |null,false                   |
|schedule_delivery|integer   |null,false                   |
|price            |integer   |null,false                   |
|tax              |integer   |null,false                   |
|profit           |integer   |null,false                   |
|user_id          |references|null,false, foreign_key: true|
### Assosiation
- has_one :Purchases
- belongs_to :Users
## Puchases
|Column           |Type      |Option                       |
|-----------------|----------|-----------------------------|
|user_id          |references|null,false, foreign_key: true|
|item_id          |references|null,false, foreign_key: true|
### Assosiation
- belongs_to :Items
- belongs_to :Users
- has_one :Shippings
## Shippings
|Column           |Type      |Option                       |
|-----------------|----------|-----------------------------|
|postal_coad      |string    |null,false                   |
|prefecture       |integer   |null,false                   |
|city             |string    |null,false                   |
|address          |string    |null,false                   |
|building         |string    |                             |
|phone_number     |string    |null,false                   |
|purchase_id      |references|null,false, foreign_key: true|
### Assosiation
- belongs_to :Purchases