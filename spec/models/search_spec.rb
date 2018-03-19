require 'rails_helper'

RSpec.describe Search, type: :model do
  subject { Search.new }

  it { is_expected.to be_a(Search) }

  describe '#query' do
    let(:search) { create(:search) }

    it 'is valid' do
      expect(search).to be_valid
    end

    it 'validates presense of name' do
      expect(search).to validate_presence_of(:query)
    end
  end
end
