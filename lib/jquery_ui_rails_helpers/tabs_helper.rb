module TabsHelper
  include ActionView::Helpers::TagHelper,
    ActionView::Helpers::UrlHelper

  def tabs_for(opts={}, &block)
    @tabs = []
    @options = opts
    
    yield self if block_given?

    to_s
  end
  
  def create(tab_id, tab_text, opts={}, &block)
    content = capture(&block)
    @tabs << JqueryUiTab.new(tab_id, tab_text, opts, content)
  end

  private

    def to_s
      tabs = ''
      content = ''
    
      @tabs.each do |tab|
        tabs << tab.render_tab
        content << tab.render_content
      end
      output = content_tag( :ul, tabs.html_safe ) + content.html_safe
    
      content_tag( :div, output.html_safe, { :id => :tabs }.merge( @options ) )
    end
  
    class JqueryUiTab
      include ActionView::Helpers::TagHelper,
        ActionView::Helpers::UrlHelper

      def initialize(tab_id, tab_text, options, content)
        @html_id, @text, @options, @content = tab_id, tab_text, options, content
      end

      def render_tab
        content_tag( :li, link_to( content_tag( :span, @text ), "#%s" % @html_id ) )
      end

      def render_content
        content_tag( :div, @content, @options.merge( :id => @html_id ) )
      end
    end
end