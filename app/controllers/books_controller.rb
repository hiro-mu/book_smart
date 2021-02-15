class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]
  before_action :move_to_index, only: [:show]

  def index
    if user_signed_in?
      @books = current_user.books
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
    if Bookmark.exists?(book_id: @book.id)
      @pagenum = @book.bookmark.pagenum
      summary = exec(@book.content[1000 * (@pagenum - 1), 300])
      if summary != nil
        @summary = summary[0].gsub("\r\n", "")
      else
        @summary = "該当の要約はありません。"
      end
      if @pagenum != 1
        before_summary = exec(@book.content[1000 * (@pagenum - 2), 300])
        if before_summary != nil
          @before_summary = before_summary[0].gsub("\r\n", "")
        else
          @before_summary = "該当の要約はありません。"
        end
      end
      @keywords = keyword(@book.content[1000 * (@pagenum - 1), 300])
    end
  end

  private

  def move_to_index
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to root_path
    end
  end

  def book_params
    params.require(:book).permit(:title, :content, :image).merge(user_id: current_user.id)
  end
  
  def exec(sentence) 
    url = URI.parse("https://api.a3rt.recruit-tech.co.jp/text_summarization/v1")
    separation = "。"
    line_count = get_line_count(sentence, separation)
    if line_count <= 1
      return [sentence]
    end
    post_data = { 
      'apikey' => ENV["A3RT_API_KEY"],
      'sentences' => sentence,
      'linenumber' => 1,
      'separation' => separation
    }
    res = post_request(url, post_data, true);
    return nil if res.code != "200"
    result = JSON.parse(res.body)
    return result['summary']
  end

  def get_line_count(sentence, separation)
    sentence.count(separation)
  end

  def post_request(url, data, use_ssl = true) 
    req = Net::HTTP::Post.new(url.request_uri)
    req.set_form_data(data)
    Net::HTTP.start(url.host, url.port, 
      :use_ssl => use_ssl, 
      :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
        http.request(req)
      end
  end

  def keyword(document)
    require 'cotoha'
    client_id = ENV["COTOHA_API_ID"]
    client_secret = ENV["COTOHA_API_SECRET_KET"]
    client = Cotoha::Client.new(client_id: client_id, client_secret: client_secret)
    client.create_access_token
    client.keywords(document: document)
  end
end
