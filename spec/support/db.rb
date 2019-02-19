require_relative "helpers/db"

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Fanboy::Spec::DBHelpers

  fixed_tables = %w[
    ar_internal_metadata
    schema_migrations
  ]

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, except: fixed_tables)
    DatabaseCleaner.strategy = :transaction

    FactoryBot.find_definitions
    # seed fixture data
    require "models/title"
    FactoryBot.create(:title, name: "Counter Strike: Global Offensive", nickname: "CS:GO", slug: "csgo",
                      developer: "Valve Corporation", priority: 1)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
