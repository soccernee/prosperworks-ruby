require "bundler/gem_tasks"
require "rake/testtask"
require 'rubocop/rake_task'

task :default => [:rubocop, :test]

Rake::TestTask.new(:test => :rubocop) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

desc 'Run rubocop'
task :rubocop do
  RuboCop::RakeTask.new
end
