class GithubJobsApiSearch
  require 'net/http'

  JOBS_SEARCH_URL = "https://jobs.github.com/positions.json"

  attr_reader :search_params

  def self.call(search_params)
    new(search_params).call
  end

  def initialize(search_params)
    @search_params = search_params
  end

  def call
    get_jobs_via_api
  end

  private

  def get_jobs_via_api
    Net::HTTP.get(search_uri)
  end

  def search_uri
    URI(JOBS_SEARCH_URL + "?search=#{format_params}")
  end

  def format_params
    search_params.delete(" \t\r\n")
  end
end
