class PagesController < ApplicationController
  def show
    @book = Book.find(params[:book_id])
    @content_s = 1000 * (params[:id].to_i - 1)
    @thispage = params[:id].to_i
  end
end
