class PagesController < ApplicationController
  def show
    @book = Book.find(params[:book_id])
    @page = @book.page
    #@content_s:出力するテキストの最初を表す 
    @content_s = 1000 * (params[:id].to_i - 1)
    #@thispage:現在開いているページ数
    @thispage = params[:id].to_i
    #highlightメソッド内で使用
    @@book_id = @book.id
    @@pagenum = @thispage
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
  
  def highlight
    highlight = Highlight.new(page_highlight_params)
    highlight.save
    items = Highlight.pluck(:text)
    render json: { post: items }
  end

  private

  def page_params
    params.require(:page).permit(:pagenum).merge(book_id: params[:book_id])
  end

  def page_update_params
    params.permit(:pagenum)
  end

  def page_highlight_params
    params.permit(:text).merge(book_id: @@book_id, pagenum: @@pagenum)
  end
end
