source "https://rubygems.org"

gem "sinatra",                         "~> 1.4"
gem "json",                            "~> 1.8"
gem "rake",                            "~> 10"
gem "dotenv",                          "~> 0.11"
gem "rack-revision",                   "~> 1.0"
gem "rack-contrib",                    "~> 1.1"
gem "activerecord",                    "~> 4.1"
gem "active_model_serializers",        "~> 0.8"
gem "sinatra-activerecord",            "~> 2.0"
gem "pg",                              "~> 0.17.0"
gem "activerecord-postgresql-adapter", "~> 0"
gem "thin",                            "~> 1.6", require: false
gem "sentry-raven",                    "~> 0.9", require: false
gem "foreman",                         "0.63.0", require: false

group :development do
  gem "capistrano",         "3.2.1"
  gem "capistrano-bundler", "1.1.2"
  gem "capistrano-rails",   "1.1.1"
end

group :development, :test do
  gem "rspec"
  gem "rack-test"
  gem "simplecov"
  gem "database_cleaner"
end