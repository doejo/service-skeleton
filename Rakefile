require "./init"
require "sinatra/activerecord/rake"
require "raven/integrations/tasks"

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

desc "Reinitialize git repository"
task :init do
  print "Re-initialize git repository? (y/n): "
  ask = STDIN.gets.strip

  if ask == "y"
    puts "Removing .git dir"
    `rm -rf ./.git`

    puts "Creating a new repository"
    `git init .`

    puts "Making initial commit"
    `git add . && git commit -m "Initial commit"`
  else
    puts "Skipped"
  end
end