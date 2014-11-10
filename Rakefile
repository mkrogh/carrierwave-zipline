require "bundler/gem_tasks"

task :console do
  require "irb"
  require "irb/completion"
  require "carrierwave/zipline"
  require "./spec/fake_upload"
  ARGV.clear
  IRB.start
end
