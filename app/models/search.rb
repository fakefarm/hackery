class Search < ApplicationRecord
  scope :uniq_keyword_count, -> { group(:keyword).distinct.count(:keyword) }

  validates :keyword, presence: true
end
