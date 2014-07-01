# Set loading from current directory
$LOAD_PATH << "."
$LOAD_PATH << "./lib"

# Initialize environment
require "bundler/setup"
require "dotenv"
require "yaml"

# Load environment variables
Dotenv.load

# Set rack env in case if its not set
ENV["RACK_ENV"] ||= "development"

# Require initializers
Dir["./config/initializers/*.rb"].each { |file| require(file) }

# Service classes
require "service/helpers"
require "service/authentication"
require "service/application"

# Load all endpoints
Dir["./service/endpoints/*_endpoint.rb"].each { |file| require(file) }

# Load middleware
Dir["./middleware/*.rb"].each { |file| require(file) }