# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| name               | string   | null: false |
| email              | string   | null: false |
| password           | string   | null: false |

## Association

- has_many :books
- has_many :highlights
- has_many :bookmarks

## books テーブル

| Column             | Type       | Options                        |
| ------------------ | -----------| ------------------------------ |
| title              | string     | null: false                    |
| content            | longtext   | null: false                    |
| user               | references | null: false, foreign_key: true |

## Association

- has_many :highlights
- has_one :bookmark
- belongs_to :user

## highlights テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| text               | string     | null: false                    |
| pagenum            | integer    | null: false                    |
| book               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

## Association

- belongs_to :book
- belongs_to :user

## bookmarks テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| pagenum            | string     | null: false                    |
| book               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

## Association

- belongs_to :book
- belongs_to :user