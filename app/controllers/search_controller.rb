class SearchController < ApplicationController
  before_action :search_jobs, only: [:new]

  def index
    respond_to :html

    @searches = Search.all
  end

  def show
    respond_to :html
  end

  def new
    respond_to :html

    @search = Search.new(search_params)
    if @search.save
      render json: @results
    else
      render plain: "Something went wrong."
    end
  end

  private

  def search_jobs
    @results = GithubJobsApiSearch.call(search_params.dig(:keyword))
  end

  def search_params
    params.require(:search).permit(:keyword)
  end
end
