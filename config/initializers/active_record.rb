require "active_record"

if ENV["DATABASE_URL"]
  ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"])
else
  env = ENV["RACK_ENV"]
  config = YAML.load_file("config/database.yml")[env]  
  ActiveRecord::Base.establish_connection(config)
end

ActiveRecord::Base.logger = Logger.new("log/activerecord_#{env}.log")