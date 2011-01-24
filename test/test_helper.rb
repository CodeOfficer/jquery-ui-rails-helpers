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

# https://gist.github.com/52976
# module HelpersSelectorAsssertions
#   def assert_select_in(html, *args, &block)
#     node = HTML::Document.new(html).root
#     assert_select(*args.unshift(node), &block)
#   end
# end
# ActionView::TestCase.send(:include, HelpersSelectorAsssertions)

class ActionView::TestCase

# Take care of RuntimeError:
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

	# setup :setup_with_controller
	#
	#   def setup_with_controller
	#     @controller = ActionView::TestCase::TestController.new
	#  		def @controller._routes
	#  			Module.new do
	#  				def self.url_helpers
	#  					Module.new
	#  				end
	#  			end
	#  		end
	#     @request = @controller.request
	#     @output_buffer = ActiveSupport::SafeBuffer.new
	#     @rendered = ''
	#     make_test_case_available_to_view!
	#     say_no_to_protect_against_forgery!
	#   end

end