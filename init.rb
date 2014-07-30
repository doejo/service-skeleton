# Set loading from current directory
$LOAD_PATH << "."
$LOAD_PATH << "./lib"

# Initialize environment
require "bundler/setup"
require "dotenv"
require "yaml"

# Load environment variables
Dotenv.load

# Set rack env and rails env in case if its not set
ENV["RACK_ENV"] ||= "development"
ENV["RAILS_ENV"] ||= ENV["RACK_ENV"]

# Require initializers
Dir["./config/initializers/*.rb"].each { |file| require(file) }

# Service classes
require "service/helpers"
require "service/authentication"
require "service/application"

# Load service workers
# require "service/workers/base_worker"
# Dir["./service/workers/*_worker.rb"].each { |file| require(file) }

# Load service endpoints
Dir["./service/endpoints/*_endpoint.rb"].each { |file| require(file) }

# Load middleware
Dir["./middleware/*.rb"].each { |file| require(file) }