class SearchController < ApplicationController
  def index
    @searches = Search.all

    respond_to do |format|
      format.html
    end
  end

  def create
    respond_to :html

    @search = Search.new(search_params)
    if @search.save
      redirect_to search_index_url
    end
  end

  private

  def search_params
    params.require(:search).permit(:keyword)
  end
end
