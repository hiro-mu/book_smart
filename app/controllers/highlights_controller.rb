class HighlightsController < ApplicationController
  def load
    items = Highlight.pluck(:text)
    render json: { post: items }
  end

  def delete
    highlight = Highlight.find_by(text: params[:text])
    highlight.destroy
    render json: { post: highlight.text }
  end

  def create
    highlight = Highlight.new(page_highlight_params)
    highlight.save
    items = Highlight.pluck(:text)
    render json: { post: items }
  end

  private

  def page_highlight_params
    params.permit(:text, :book_id, :pagenum)
  end
end
