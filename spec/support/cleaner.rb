RSpec.configure do |config|
  fixed_tables = %w[
    ar_internal_metadata
    schema_migrations
  ]

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, except: fixed_tables)
    DatabaseCleaner.strategy = :transaction
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
