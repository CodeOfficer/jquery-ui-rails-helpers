require "jquery_ui_rails_helpers/jquery_ui_base"

module ProgressbarHelper
  include JqueryUiRailsHelpers::UiHelper

  def ui_progressbar(opts={}, &block)
    ui(opts, JqueryUiProgressbar, &block)
  end
  
  class JqueryUiProgressbar < JqueryUiRailsHelpers::JqueryUiBase
    def initialize(opts={}, controller, &block)
      @html_options = { :id => :progressbar }.merge( opts[:html] )
      @content = controller.capture(&block) || ""
    end

    def render
      # collect the html for our tabs
      @html = content_tag( :div, @content.html_safe, @html_options)
  
      # generate the javascript for jquery ui
      @javascript = javascript_tag "$(function(){ $('#%s').progressbar(); });" % @html_options[:id]

      # return self, for chaining
      self
    end

  end
  
end