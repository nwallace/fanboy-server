source "https://rubygems.org"
ruby "2.6.1"

gem "sinatra", require: "sinatra/base"

gem "pg"
gem "activerecord"

gem "httparty"
gem "pagy"

group :production do
  gem "unicorn"
  gem "pry", require: false
  gem "pry-nav", require: false
end

group :development, :test do
  gem "pry"
  gem "pry-nav"
  gem "pry-remote"

  gem "factory_bot"
  gem "thin"
end

group :development do
  gem "capistrano"
  gem "neovim"
end

group :test do
  gem "rspec"

  gem "database_cleaner"
  gem "webmock"
  gem "timecop"
  gem "active_record_block_matchers"
  gem "fuubar"

  gem "capybara"
  gem "cuprite", github: "machinio/cuprite"
end
