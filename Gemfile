source "https://rubygems.org"

gem "sinatra",                         "1.4.5"
gem "json",                            "1.8.1"
gem "rake",                            "10.3.2"
gem "dotenv",                          "0.11.1"
gem "rack-revision",                   "1.0.2"
gem "rack-contrib",                    "1.1.0"
gem "activerecord",                    "4.1.2"
gem "active_model_serializers",        "0.8.1"
gem "sinatra-activerecord",            "2.0.2"
gem "pg",                              "0.17.1"
gem "activerecord-postgresql-adapter", "0.0.1"
gem "puma",                            "2.9.0",  require: false
gem "sentry-raven",                    "0.9.4",  require: false
gem "foreman",                         "0.63.0", require: false

# Optional gems
# gem "sidekiq", "3.2.1"

group :development do
  gem "capistrano",         "3.2.1"
  gem "capistrano-bundler", "1.1.2"
  gem "capistrano-rails",   "1.1.1"
end

group :development, :test do
  gem "rspec",            "3.0.0"
  gem "rack-test",        "0.6.2"
  gem "simplecov",        "0.8.2"
  gem "database_cleaner", "1.3.0"
end