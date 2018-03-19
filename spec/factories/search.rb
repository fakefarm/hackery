FactoryBot.define do
  factory :search do
    keyword { ['rails', 'node', 'javascript'].sample }
  end
end
