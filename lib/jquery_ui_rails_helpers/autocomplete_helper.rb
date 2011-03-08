require "jquery_ui_rails_helpers/jquery_ui_base"

module AutocompleteHelper
  include JqueryUiRailsHelpers::UiHelper,
          ActionView::Helpers::TagHelper

  def ui_autocomplete(opts={}, &block)
    ui(opts, JqueryUiAutocomplete, &block)
  end
  
  class JqueryUiAutocomplete < JqueryUiRailsHelpers::JqueryUiBase
    def initialize(opts={}, controller, &block)
      @html_options = { :id => :autocomplete }.merge( opts[:html] )
      @ui_options = { :source => [] }.merge( opts[:ui] )
      @content = controller.capture(&block) if block_given?
      @content = @content || tag(:input, :type => 'text')
    end

    def render
      # collect the html for our tabs
      @html = content_tag( :div, @content.html_safe, @html_options)
  
      # generate the javascript for jquery ui
      @javascript = javascript_tag "$(function(){ $('#%s input:text').autocomplete(%s); });" % [@html_options[:id], @ui_options.to_json]

      # return self, for chaining
      self
    end

  end
  
end