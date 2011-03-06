require "jquery_ui_rails_helpers/jquery_ui_base"

module AccordionHelper
  include JqueryUiRailsHelpers::UiHelper

  def ui_accordion(opts={}, &block)
    ui(opts, JqueryUiAccordion, &block)
  end
  
  class JqueryUiAccordion < JqueryUiRailsHelpers::JqueryUiBase
    def initialize(opts={}, controller, &block)
      @panels = []
      @controller = controller
      @html_options = { :id => :accordion }.merge( opts[:html] )
    
      yield self if block_given?
    end
  
    def panel(panel_id, panel_title, opts={}, &block)
      content = @controller.capture(&block)
      opts = { :html => {} }.merge(opts)
      
      header = content_tag( :h3, link_to( content_tag( :span, panel_title ), "#%s" % panel_id ) )
      panel = content_tag( :div, content, opts[:html].merge( :id => panel_id ) )
      
      @panels << (header + panel)
    end

    def render
      # collect the html for our tabs
      @html = content_tag( :div, @panels.join('').html_safe, @html_options)
  
      # generate the javascript for jquery ui
      @javascript = javascript_tag "$(function(){ $('#%s').accordion(); });" % @html_options[:id]

      # return self, for chaining
      self
    end

  end
  
end