class PagesController < ApplicationController

  def show
    @book = Book.find(params[:book_id])
    @pagenum = params[:id].to_i
  end

end
