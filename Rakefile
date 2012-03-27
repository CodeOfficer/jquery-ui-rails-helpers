require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "jquery_ui_rails_helpers"
  gem.homepage = "https://github.com/beardedstudio/jquery_ui_rails_helpers"
  gem.license = "MIT"
  gem.summary = %Q{JQuery UI helpers you can use in your Rails apps}
  gem.description = %Q{JQuery UI helpers you can use in your Rails apps}
  gem.email = [""]
  gem.authors = ["Bearded Studio", "CodeOfficer"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
  gem.files.include ['lib/*/*']
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'

desc "Run RSpec"
RSpec::Core::RakeTask.new do |t|
  t.verbose = false
end

task :default => :spec
