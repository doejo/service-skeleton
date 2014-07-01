env = ENV["RACK_ENV"]
config = YAML.load_file("config/database.yml")[env]

require "active_record"

ActiveRecord::Base.establish_connection(config)
ActiveRecord::Base.logger = Logger.new("log/activerecord_#{env}.log")