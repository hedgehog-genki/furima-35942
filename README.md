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
- has_many :Purchases
## Items
|Column              |Type      |Option                       |
|--------------------|----------|-----------------------------|
|name                |string    |null,false                   |
|info                |text      |null,false                   |
|category_id         |integer   |null,false                   |
|status_id           |integer   |null,false                   |
|fee_status_id       |integer   |null,false                   |
|prefecture_id       |integer   |null,false                   |
|schedule_delivery_id|integer   |null,false                   |
|price               |integer   |null,false                   |
|user                |references|null,false, foreign_key: true|
### Assosiation
- has_one :Purchase
- belongs_to :User
## Puchases
|Column           |Type      |Option                       |
|-----------------|----------|-----------------------------|
|user             |references|null,false, foreign_key: true|
|item             |references|null,false, foreign_key: true|
### Assosiation
- belongs_to :Item
- belongs_to :User
- has_one :Shipping
## Shippings
|Column           |Type      |Option                       |
|-----------------|----------|-----------------------------|
|postal_coad      |string    |null,false                   |
|prefecture_id    |integer   |null,false                   |
|city             |string    |null,false                   |
|address          |string    |null,false                   |
|building         |string    |                             |
|phone_number     |string    |null,false                   |
|purchase         |references|null,false, foreign_key: true|
### Assosiation
- belongs_to :Purchase