if %[development].include? Rails.env
  ActiveRecord::Migration.say_with_time('Creating licenses') do
    FactoryBot.create(:search)
  end
end
