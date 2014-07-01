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

# Load all support helpers
Dir["./spec/support/*.rb"].each { |f| require(f) }

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include ResponseHelper
  config.include FixtureHelper

  config.before(:suite) do
  end

  config.before(:each) do
  end

  config.after(:each) do
  end
end

def app
  Service::Application
end

configure do
  set :environment, :test
  set :run, false
  set :raise_errors, true
  set :logging, false
end