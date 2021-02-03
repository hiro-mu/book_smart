class BookmarksController < ApplicationController

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save
    redirect_to root_path
  end

  def update
    @book = Book.find(params[:book_id])
    @bookmark = Bookmark.find(@book.bookmark.id)
    @bookmark.update(bookmark_update_params)
    redirect_to root_path
  end

  private

  def bookmark_params
    params.require(:page).permit(:pagenum, :book_id)
  end

  def bookmark_update_params
    params.permit(:pagenum, :book_id)
  end

end
