require 'bundler'
require 'rake'
require 'rake/testtask'
Bundler::GemHelper.install_tasks

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the simple_form plugin.'
Rake::TestTask.new(:test) do |t|
	t.libs << 'lib'
	t.libs << 'test'
	t.pattern = 'test/**/*_test.rb'
	t.verbose = true
end