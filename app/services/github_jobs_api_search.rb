class GithubJobsApiSearch
  require 'net/http'

  JOBS_SEARCH_URL = "https://jobs.github.com/positions.json"

  attr_reader :search_keywords, :jobs_uri

  def self.call(search_keywords)
    new(search_keywords).call
  end

  def initialize(search_keywords)
    @search_keywords = search_keywords
  end

  def call
    get_jobs_via_api
  end

  def get_jobs_via_api
    Net::HTTP.get(search_uri)
  end

  def search_uri
    URI(JOBS_SEARCH_URL + "?search=#{format_params}")
  end

  def format_params
    search_keywords.delete(" \t\r\n")
  end
end
