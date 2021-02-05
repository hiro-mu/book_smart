class BooksController < ApplicationController

  def index
    @books = Book.all
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
      @summary = exec(@book.content[1000 * (@pagenum - 1), 300])[0].gsub("\r\n", "")
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :content, :image)
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
end
