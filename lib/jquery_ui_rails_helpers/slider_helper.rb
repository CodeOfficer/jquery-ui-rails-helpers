require "jquery_ui_rails_helpers/jquery_ui_base"

module SliderHelper
  include JqueryUiRailsHelpers::UiHelper

  def ui_slider(opts={}, &block)
    ui(opts, JqueryUiSlider, &block)
  end
  
  class JqueryUiSlider < JqueryUiRailsHelpers::JqueryUiBase
    def initialize(opts={}, controller, &block)
      @html_options = { :id => :slider }.merge( opts[:html] )
      @content = controller.capture(&block) if block_given?
      @content = @content || ""
    end

    def render
      # collect the html for our tabs
      @html = content_tag( :div, @content.html_safe, @html_options)
  
      # generate the javascript for jquery ui
      @javascript = javascript_tag "$(function(){ $('#%s').slider(); });" % @html_options[:id]

      # return self, for chaining
      self
    end

  end
  
end