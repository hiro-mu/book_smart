class PagesController < ApplicationController
  
  def show
    @book = Book.find(params[:book_id])
    #@content_s:出力するテキストの最初を表す 
    @content_s = 1000 * (params[:id].to_i - 1)
    @pagenum = params[:id].to_i
  end

end
