require "jquery_ui_rails_helpers/jquery_ui_base"

module TabsHelper
  include JqueryUiRailsHelpers::UiHelper

  def tabs_for(opts={}, &block)
    ui(opts, JqueryUiTabs, &block)
  end
  
  class JqueryUiTabs < JqueryUiRailsHelpers::JqueryUiBase
    def initialize(opts={}, controller, &block)
      @tabs = []
      @tab_contents = []
      @controller = controller
      @html_options = { :id => :tabs }.merge( opts[:html] )
    
      yield self if block_given?
    end
  
    def create(tab_id, tab_text, opts={}, &block)
      content = @controller.capture(&block)
      opts = { :html => {} }.merge(opts)
    
      @tabs << content_tag( :li, link_to( content_tag( :span, tab_text ), "#%s" % tab_id ) )
      @tab_contents << content_tag( :div, content, opts[:html].merge( :id => tab_id ) )
    end

    def render
      # collect the html for our tabs
      output = content_tag( :ul, @tabs.join('').html_safe ) + @tab_contents.join('').html_safe
      @html = content_tag( :div, output.html_safe, @html_options)
  
      # generate the javascript for jquery ui
      @javascript = javascript_tag "$(function(){ $('#%s').tabs(); });" % @html_options[:id]

      # return self, for chaining
      self
    end

  end
  
end