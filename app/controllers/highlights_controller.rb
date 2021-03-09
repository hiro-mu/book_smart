class HighlightsController < ApplicationController
  before_action :move_to_index, except: [:index, :load]
  
  def index
  end

  def load
    items = Highlight.pluck(:text)
    render json: { post: items }
  end

  def delete
    highlight = Highlight.find_by(text: params[:text])
    highlight.destroy
  end

  def create
    highlight = Highlight.new(page_highlight_params)
    highlight.save
  end

  private

  def move_to_index
    unless params[:text]
      redirect_to root_path
    end
  end

  def page_highlight_params
    params.permit(:text, :book_id, :pagenum).merge(user_id: current_user.id)
  end
end
