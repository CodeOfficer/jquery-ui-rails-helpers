require "jquery_ui_rails_helpers/jquery_ui_base"

module SliderHelper
  include JqueryUiRailsHelpers::UiHelper

  def ui_slider(opts={}, &block)
    ui(opts, JqueryUiSlider, &block)
  end
  
  class JqueryUiSlider < JqueryUiRailsHelpers::JqueryUiBase
    def initialize(opts={}, controller, &block)
      @html_options = { :id => :slider }.merge( opts[:html] )
      @ui_options = {}.merge opts[:ui]
      @content = controller.capture(&block) if block_given?
      @content = @content || ""
    end

    def render
      # collect the html for our tabs
      @html = content_tag( :div, @content.html_safe, @html_options)
  
      # generate the javascript for jquery ui
      @javascript = javascript_tag "$(function(){ $('#%s').slider(%s); });" % [@html_options[:id], @ui_options.to_json]

      # return self, for chaining
      self
    end

  end
  
end