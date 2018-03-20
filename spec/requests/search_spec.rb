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

  describe 'GET /search/:id' do
    let(:search) { Search.first }

    before do
      get search_path(search)
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /search' do
    let(:param){ 'denver' }

    before do
      get "/search/new?search[keyword]=#{param}"
    end

    context 'when performing a search with valid keywords' do
      it 'returns a 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns an object of json' do
        expect(response.body).to include('Denver, CO')
      end
    end

    context 'when performing a search with keywords not found' do
      let(:param){ 'foo' }

      it 'returns a 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns an object of json' do
        expect(response.body).to eq("[]")
      end
    end
  end
end
