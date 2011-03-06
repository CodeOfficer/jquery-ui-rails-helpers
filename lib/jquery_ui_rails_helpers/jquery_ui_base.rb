module JqueryUiRailsHelpers
  
  module UiHelper
    def ui(opts={}, renderer_class, &block)
      opts = { :html => {}, :ui => {}, :script_for => :jquery_ui_helpers}.merge(opts)

      raise ArgumentError, "Missing block" unless block_given?
      ui_widget = renderer_class.new( opts, self, &block ).render
    
      content_for opts[:script_for], ui_widget.javascript
      ui_widget.html
    end
  end
  
  class JqueryUiBase
    include ActionView::Helpers::TagHelper,
            ActionView::Helpers::UrlHelper,
            ActionView::Helpers::CaptureHelper,
            ActionView::Helpers::JavaScriptHelper
    
    attr_accessor :html, :javascript
  end
end
