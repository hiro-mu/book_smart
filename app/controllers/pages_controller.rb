class PagesController < ApplicationController

  def show
    @book = Book.find(params[:book_id])
    @pagenum = params[:id].to_i
    @content_s = 1000 * (@pagenum - 1)
  end

end
