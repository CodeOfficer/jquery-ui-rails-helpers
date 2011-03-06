module TabsHelper
  include ActionView::Helpers::TagHelper,
          ActionView::Helpers::UrlHelper,
          ActionView::Helpers::CaptureHelper,
          ActionView::Helpers::JavaScriptHelper

  def tabs_for(opts={}, &block)
    opts = { :html => {}, :ui => {}, :script_for => :jquery_ui_helpers}.merge(opts)
    
    @tabs = []
    @html_options = { :id => :tabs }.merge( opts[:html] )
    @script_for = opts[:script_for]
    
    yield self if block_given?
    
    to_s
  end
  
  def create(tab_id, tab_text, opts={}, &block)
    content = capture(&block)
    opts = { :html => {} }.merge(opts)
    
    @tabs << {
      :tab => content_tag( :li, link_to( content_tag( :span, tab_text ), "#%s" % tab_id ) ),
      :content => content_tag( :div, content, opts[:html].merge( :id => tab_id ) )
    }
  end

  private
  
    def to_s
      # collect the html for our tabs
      tabs = @tabs.collect {|t| t[:tab] }.join('')
      content = @tabs.collect {|t| t[:content] }.join('')
      output = content_tag( :ul, tabs.html_safe ) + content.html_safe
      
      # generate the javascript for jquery ui
      javascript = javascript_tag "$(function(){ $('#%s').tabs(); });" % @html_options[:id]
      content_for @script_for, javascript
      
      # return the tabs html in a wrapper
      content_tag( :div, output.html_safe, @html_options)
    end
end