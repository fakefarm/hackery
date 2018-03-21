class Search < ApplicationRecord
  scope :last_search, -> { last.keyword }
  scope :searches_by_keyword, -> { where(keyword: last_search) }
  scope :search_history, -> { searches_by_keyword.pluck(:keyword, :created_at) }
  scope :uniq_keyword_count, -> { group(:keyword).distinct.count(:keyword) }

  validates :keyword, presence: true
end
