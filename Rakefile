require "./init"
require "sinatra/activerecord/rake"

begin
  require "rspec/core/rake_task"
rescue LoadError
  puts "Rspec is not loaded"
end

if defined?(RSpec)
  RSpec::Core::RakeTask.new(:test) do |t|
    t.pattern = "spec/**/*_spec.rb"
    t.verbose = false
  end
end

# Require all available rake tasks under "tasks" dir
Dir["#{File.dirname(__FILE__)}/tasks/**/*.rake"].sort.each { |file| load(file) }

task :default => :test