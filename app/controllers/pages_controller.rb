class PagesController < ApplicationController
  def show
    @book = Book.find(params[:book_id])
    @pagenum = params[:id].to_i
  end

  def search
    require 'google/apis/customsearch_v1'
    api_key = ENV["GOOGLE_CUSTOM_SEARCH_KEY"]
    cse_id = ENV["GOOGLE_CUSTOM_SEARCH_CSE_ID"]
    searcher = Google::Apis::CustomsearchV1::CustomSearchAPIService.new
    searcher.key = api_key
    query = params.permit(:search)
    results = searcher.list_cses(q: query, cx: cse_id)
    @items = results.items
    @query = query[:search]
  end
end