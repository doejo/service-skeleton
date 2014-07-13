require "./init"

require "sinatra/activerecord/rake"
require "raven/tasks"

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

desc "Start application console"
task :console do
  require "irb"
  require "irb/completion"
  require "pp"
  
  ARGV.clear
  IRB.start
end

task :default => :test