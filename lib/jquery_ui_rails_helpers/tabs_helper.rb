module TabsHelper

  def tabs_for(opts={}, &block)
    opts = { :html => {}, :ui => {}, :script_for => :jquery_ui_helpers}.merge(opts)

    raise ArgumentError, "Missing block" unless block_given?
    tabs = JqueryUiTabs.new( opts, self, &block ).render
    
    content_for opts[:script_for], tabs.javascript
    tabs.html
  end
  
  class JqueryUiTabs
    include ActionView::Helpers::TagHelper,
            ActionView::Helpers::UrlHelper,
            ActionView::Helpers::CaptureHelper,
            ActionView::Helpers::JavaScriptHelper
    
    attr_accessor :html, :javascript
    
    def initialize(opts={}, controller, &block)
      @tabs = []
      @controller = controller
      @html_options = { :id => :tabs }.merge( opts[:html] )
    
      yield self if block_given?
    end
  
    def create(tab_id, tab_text, opts={}, &block)
      content = @controller.capture(&block)
      opts = { :html => {} }.merge(opts)
    
      @tabs << {
        :tab => content_tag( :li, link_to( content_tag( :span, tab_text ), "#%s" % tab_id ) ),
        :content => content_tag( :div, content, opts[:html].merge( :id => tab_id ) )
      }
    end

    def render
      # collect the html for our tabs
      tabs = @tabs.collect {|t| t[:tab] }.join('')
      content = @tabs.collect {|t| t[:content] }.join('')
      output = content_tag( :ul, tabs.html_safe ) + content.html_safe
    
      # generate the javascript for jquery ui
      @javascript = javascript_tag "$(function(){ $('#%s').tabs(); });" % @html_options[:id]
    
      # return the tabs html in a wrapper
      @html = content_tag( :div, output.html_safe, @html_options)
      
      self
    end

  end
  
end