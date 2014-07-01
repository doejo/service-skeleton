require "./init"

require "raven/tasks"
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

task :console do
  require "irb"
  require "irb/completion"
  require "pp"
  
  ARGV.clear
  IRB.start
end

task :default => :test