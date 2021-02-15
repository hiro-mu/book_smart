# 📚BookSmart
### 読書を快適に行うことに特化した読書アプリケーション

# 概要

### 本から効率的に情報をインプットすることを目的とした読書ツールである。

これから読むページ前後の内容の要約機能やキーワード表示機能を搭載し、
読書への導入をより簡単に行うことのできる読書ツール。
限られた時間でも効率的に情報をインプットすることができる。

# App URL
### **https://book-smart-33921.herokuapp.com/**


# 利用方法

#### `トップページ上部から新規登録・ログイン`
#### `一覧画面(あなたの本棚）へ遷移する`
#### `本を追加するボタンから、読みたい本の情報を入力`
#### `追加後は一覧画面へ戻る`<br>

#### `一覧画面から1冊の本を選択→本の詳細画面へ遷移する`
#### `初めから読むボタンを押すことで読書ページへ遷移`<br>

#### `しおりを挟むボタンでブックマークが可能`
#### `ブックマーク時に現れるメッセージは読書量によって変化→読書意欲が湧く`<br>

#### `ブックマークをした前後の文章の要約と、これから読む場所のキーワードが表示される`<br>

#### `読書ページで文字列上をドラッグすることで、ハイライト機能を使うことができる`
#### `同じ文字列をクリックすることでハイライトを消去することができる`<br>

#### `文字列をハイライトにした状態でカーソルを近づけると検索ボタン（虫眼鏡）が表示される`
#### `虫眼鏡をクリック→該当の文字列をweb検索することができる`

# 課題解決
| ユーザーストーリーから考える課題                                                        | 課題解決                                         |
| ------------------------------------------------------------------------------- | ------------------------------------------------- |
| 読書をしたいがまとまった時間が取れない 　　　　　                                          | これから読むページの前後の内容を要約してくれる機能によって、読書への導入を容易にする |
| 内容が難しく、重要箇所がわからない　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　| キーワード抽出機能により、重要度の高いキーワードを見つけやすくする　|
| 読書中に重要だと思った部分を保存しておきたい                     　　　　　                 | ハイライト機能によって文章中の文字の背景色を変えることができる |
| わからないと思った単語や内容についてアプリを変えることなくすぐに検索したい　　　　　　　              | 検索機能によって気になった内容を検索できる |

# DB設計

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
