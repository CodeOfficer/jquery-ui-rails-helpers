# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "jquery_ui_rails_helpers/version"

Gem::Specification.new do |s|
	s.name					= "jquery_ui_rails_helpers"
	s.version				= JqueryUiRailsHelpers::VERSION
	s.platform			= Gem::Platform::RUBY
	s.summary				= "jQuery UI Rails Helpers"
	s.authors				= ["CodeOfficer"]
	s.email					= ["codeofficer@gmail.com"]
	s.homepage			= "http://www.codeofficer.com/"
	s.description 	= "jQuery UI Rails Helpers"

	# s.add_development_dependency("rails")
	# s.add_development_dependency("shoulda")

	s.files					= `git ls-files`.split("\n")
	s.test_files		= `git ls-files -- {test,spec,features}/*`.split("\n")
	s.executables		= `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
	s.require_paths = ["lib"]

	s.rubyforge_project = "jquery_ui_rails_helpers"
end
