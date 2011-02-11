require 'rubygems'
require 'bundler'

Bundler.setup

require 'test/unit'
require 'shoulda'
require 'action_controller'
require 'action_controller/test_case'
require 'action_view'
require 'action_view/template'
require 'action_view/test_case'

$:.unshift File.expand_path("../../lib", __FILE__)
require 'jquery_ui_rails_helpers'

class ActionView::TestCase

# Take care of the RuntimeError:
# In order to use #url_for, you must include routing helpers explicitly.
# For instance, `include Rails.application.routes.url_helpers
	setup :shhhhhh_url_helpers

	def shhhhhh_url_helpers
		def @controller._routes
			Module.new do
				def self.url_helpers
					Module.new
				end
			end
		end
	end

end