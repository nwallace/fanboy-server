source "https://rubygems.org"
ruby "2.6.1"

gem "sinatra", require: "sinatra/base"

gem "rake"

gem "pg"
gem "activerecord", require: "active_record"
gem "sinatra-activerecord"

gem "dotenv", require: false
gem "inquiry", github: "nwallace/inquiry"

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
  gem "rerun"
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
