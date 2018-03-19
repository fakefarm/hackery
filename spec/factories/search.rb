FactoryBot.define do
  factory :search do
<<<<<<< HEAD
    query 'rails'
=======
    query { ['rails', 'node', 'javascript'].sample }
>>>>>>> Add Search model and specs.
  end
end
