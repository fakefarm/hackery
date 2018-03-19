require 'rails_helper'

RSpec.describe SearchController, type: :request do

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

  describe 'GET /search/:id' do
    let(:search) { Search.first }

    before do
      get search_path(search)
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end
  end
end
