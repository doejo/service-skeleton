if ENV["SENTRY_URL"]
  require "raven"

  Raven.configure do |config|
    config.environments        = %w(staging production)
    config.current_environment = ENV["RACK_ENV"]
    config.dsn                 = ENV["SENTRY_URL"]
    config.excluded_exceptions = ["Sinatra::NotFound"]
  end
end