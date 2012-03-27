require "jquery_ui_rails_helpers/jquery_ui_base"

module JqueryUI
  module DateRangeHelper
    include JqueryUiRailsHelpers::UiHelper

    def ui_daterange(opts={}, &block)
      ui(opts, JqueryUiDateRange, &block)
    end
    
    class JqueryUiDateRange < JqueryUiRailsHelpers::JqueryUiBase
      def initialize(opts={}, controller, &block)
        @html_options = { :id => :daterange }.merge( opts[:html] )
        @ui_options = {}.merge opts[:ui]
        @content = controller.capture(&block) if block_given?
        @content = @content || ""
      end

      def render
        # collect the html for our tabs
        @html = content_tag( :input, @content.html_safe, @html_options)
    
        # generate the javascript for jquery ui
        @javascript = javascript_tag "$(function(){ $('#%s').daterangepicker(%s); });" % [@html_options[:id], @ui_options.to_json]

        # return self, for chaining
        self
      end
    end
  end
end