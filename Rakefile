require "bundler/gem_tasks"
require 'rake'
require 'rake/testtask'

task :default => [:test_units]

desc "Run tests"
Rake::TestTask.new("test_units") { |t|
  t.libs << "test"
  t.pattern = 'test/*_test.rb'
  t.verbose = true
  t.warning = true
}
