class PagesController < ApplicationController
  def show
    @book = Book.find(params[:book_id])
    #@content_s:出力するテキストの最初を表す 
    @content_s = 1000 * (params[:id].to_i - 1)
    @pagenum = params[:id].to_i
  end

  def create
    @page = Page.new(page_params)
    @page.save
    redirect_to root_path
  end

  def update
    @book = Book.find(params[:book_id])
    @page = Page.find(@book.page.id)
    @page.update(page_update_params)
    redirect_to root_path
  end

  private

  def page_params
    params.require(:page).permit(:pagenum, :book_id)
  end

  def page_update_params
    params.permit(:pagenum, :book_id)
  end

end
