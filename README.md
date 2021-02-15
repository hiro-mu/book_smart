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
| ユーザーストーリーから考える課題                                                  | 課題解決                                         |
| ---------------------------------------------------------------------------- | ----------------------------------------------- |
| 読書をしたいがまとまった時間が取れない                                              | これから読むページの前後の内容を要約してくれる機能によって、読書への導入を容易にする |
| 内容が難しく、重要箇所がわからない                                                | キーワード抽出機能により、重要度の高いキーワードを見つけやすくする |
| 読書中に重要だと思った部分を保存しておきたい                                        | ハイライト機能によって文章中の文字の背景色を変えることができる |
| わからないと思った単語や内容についてアプリを変えることなくすぐに検索したい               | 検索機能によって気になった内容を検索できる |

# 機能一覧
|機能      |概要       |
| ------- | --------- |
| ユーザー管理機能 | 新規登録・ログイン・ログアウトが可能。 |
| 本追加機能 | ユーザーごとに本を追加することが可能。 |
| 本詳細表示機能 | 本の詳細が詳細ページで閲覧可能。 |
| ブックマーク機能 | 現在のページを保存することができ、次回は続きから読むことが可能。 |
| ハイライト機能 | 文字列上をドラッグすることでその文字列を保存し、背景色を変更して表示することが可能。|
| 内容要約機能 | ブックマークしたページ前後の内容を要約した文章を詳細ページで閲覧可能。|
| キーワード抽出機能 | ブックマークしたページの続きの内容のキーワードを抽出し、ランキング化したものを詳細ページで閲覧可能。|
| キーワード検索機能 | 文章中の文字列をweb上で検索した結果を検索結果ページで閲覧可能。|

# 追加予定機能
・読書ページにメモ欄を追加予定。
・同じ本を他のユーザーと共有できる機能を追加予定。(他ユーザーのハイライトも異なる背景色で表示する)

# 各機能に使用したAPI一覧
|機能      |概要       |
| ------- | --------- |
| 内容要約機能 | A3RT Text Summarization API (リクルートテクノロジーズ) |
| キーワード抽出機能 | COTOHA API (NTTコミュニケーションズ) |
| キーワード検索機能 | Google Custom Search (Google) |

# ローカルでの動作方法
$ git clone https://github.com/hiro-mu/book_smart.git
$ cd book_smart
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
 http://localhost:3000

# 開発環境
- VScode
- Ruby 2.6.5
- Rails 6.0.3.4
- mysql 14.14
- JavaScript
- gem 3.0.3
- heroku 7.47.12

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
