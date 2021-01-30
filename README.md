# テーブル設計

## books テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| title              | string   | null: false |
| content            | longtext | null: false |

## Association

- has_many :highlights
- has_one :page

## highlights テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| text               | string     | null: false                    |
| point              | longtext   | null: false                    |
| book               | references | null: false, foreign_key: true |

## Association

- belongs_to :book

## pages テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| pagenum            | string     | null: false                    |
| book               | references | null: false                    |

## Association
- belongs_to :book