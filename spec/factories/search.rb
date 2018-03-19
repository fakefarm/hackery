FactoryBot.define do
  factory :search do
    query { ['rails', 'node', 'javascript'].sample }
  end
end
