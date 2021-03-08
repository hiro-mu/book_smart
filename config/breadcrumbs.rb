
crumb :root do
  link "あなたの本棚", root_path
end

crumb :books do
  cur_url = request.url
  book_id = cur_url.match("books/([0-9]+)/")
  link "本の詳細", "/#{book_id}"
  parent :root
end

crumb :pages do
  link "ページ", book_page_path
  parent :books
end

crumb :searches do
  link "検索画面"
  parent :pages
end