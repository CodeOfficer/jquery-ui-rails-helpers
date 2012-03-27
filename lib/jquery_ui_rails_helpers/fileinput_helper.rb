require "jquery_ui_rails_helpers/jquery_ui_base"

module JqueryUI
  module FileinputHelper
    include JqueryUiRailsHelpers::UiHelper

    def ui_fileinput(opts={}, &block)
      ui(opts, JqueryUiFileinput, &block)
    end
    
    class JqueryUiFileinput < JqueryUiRailsHelpers::JqueryUiBase
      def initialize(opts={}, controller, &block)
        @html_options = { :id => :fileinput }.merge( opts[:html] )
        @ui_options = {}.merge opts[:ui]
        @content = controller.capture(&block) if block_given?
        @content = @content || ""
      end

      def render
        # collect the html for our tabs
        @html = content_tag( :input, @content.html_safe, @html_options.merge(:type => 'file'))
    
        # generate the javascript for jquery ui
        @javascript = javascript_tag "$(function(){ $('#%s').customFileInput(%s); });" % [@html_options[:id], @ui_options.to_json]

        # return self, for chaining
        self
      end
    end  
  end
end