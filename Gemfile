source "https://rubygems.org"

gem "sinatra",                         "1.4.7"
gem "sinatra-contrib",                 "1.4.7"
gem "sinatra-activerecord",            "2.0.10"
gem "json",                            "1.8.1"
gem "rake",                            "10.3.2"
gem "dotenv",                          "1.0.2"
gem "rack-revision",                   "1.0.2"
gem "rack-contrib",                    "1.2.0"
gem "rack-heartbeat",                  "1.0.1"
gem "activerecord",                    "4.2.7"
gem "active_model_serializers",        "0.10.2"
gem "pg",                              "0.18.2"
gem "activerecord-postgresql-adapter", "0.0.1"
gem "puma",                            "2.14.0", require: false
gem "sentry-raven",                    "0.12.3", require: false
gem "foreman",                         "0.63.0", require: false # DO NOT UPDATE

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