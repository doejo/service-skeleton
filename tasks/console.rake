desc "Start application console"
task :console do
  require "irb"
  require "irb/completion"
  require "pp"
  
  ARGV.clear
  IRB.start
end