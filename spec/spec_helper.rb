ENV["RACK_ENV"] = "test"

require "simplecov"

SimpleCov.start do
  add_filter ".bundle/"
  add_filter "spec/"
  add_filter "config/initializers/"
end

require "./init"
require "sinatra"
require "rack/test"
require "database_cleaner"

# Load all support helpers
Dir["./spec/support/*.rb"].each { |f| require(f) }

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include ResponseHelper
  config.include FixtureHelper

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

def app
  Service::Application.tap do |a|
    a.use Middleware::RequestLogger, Logger.new("./log/requests_test.log")
    a.use Middleware::ExceptionHandler
  end
end

configure do
  set :environment, :test
  set :run, false
  set :raise_errors, true
  set :logging, false
end