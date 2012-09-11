require "jquery_ui_rails_helpers/jquery_ui_base"

module JqueryUI
  module ButtonHelper
    include JqueryUiRailsHelpers::UiHelper

    def ui_button(opts={}, &block)
      ui(opts, JqueryUiButton, &block)
    end
    
    class JqueryUiButton < JqueryUiRailsHelpers::JqueryUiBase
      def initialize(opts={}, controller, &block)
        @html_options = { :id => :button }.merge( opts[:html] )
        @ui_options = {}.merge opts[:ui]
        @content = controller.capture(&block) if block_given?
        @content = @content || opts[:label] || "Press me!"
      end

      def render
        # collect the html for our tabs
        @html = content_tag( :button, @content.html_safe, @html_options)
    
        # generate the javascript for jquery ui
        @javascript = javascript_tag "$(function(){ $('#%s').button(%s); });" % [@html_options[:id], @ui_options.to_json]

        # return self, for chaining
        self
      end

    end
  end
end