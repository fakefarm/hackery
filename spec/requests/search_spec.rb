require 'rails_helper'

RSpec.describe SearchController, type: :request, vcr: { cassette_name: "SearchController", record: :new_episodes } do
  before do
    create_list(:search, 3)
  end

  describe 'GET /search' do
    before do
      get search_index_path
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end
  end
end
