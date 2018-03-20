require 'rails_helper'

RSpec.describe GithubJobsApiSearch, type: :service do
  let(:search_keywords){ 'rails' }

  describe '::JOBS_SEARCH_URL' do
    let(:jobs_url){ 'https://jobs.github.com/positions.json' }

    it 'will contain jobs search URL' do
      expect(described_class::JOBS_SEARCH_URL).to eq(jobs_url)
    end
  end

  describe '#initialize' do
    it 'will not raise error' do
      
      expect{ described_class.new(search_keywords) }.not_to raise_error
    end
  end

  describe '#call' do
    let(:test_json) { "{\"data\":\"foo\"}" }

    context 'when searching for a single keyword' do
      it 'will return JSON object based on keyword' do
        allow(described_class).to receive(:call).and_return(test_json)

        described_class.call(search_keywords)

        expect(described_class).to receive_message_chain(:call).with(search_keywords)
        expect(described_class.call(search_keywords)).to eq(test_json)
      end
    end

    context 'when searching for city' do
      let(:search_keywords){ 'denver' }

      it 'will return JSON objects based on keywords' do
        allow(described_class).to receive(:call).and_return(test_json)

        described_class.call(search_keywords)

        expect(described_class).to receive_message_chain(:call).with(search_keywords)
        expect(described_class.call(search_keywords)).to eq(test_json)
      end
    end
  end
end
