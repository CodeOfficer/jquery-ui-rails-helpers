module JqueryUiRailsHelpers
  class JqueryUiBase
    include ActionView::Helpers::TagHelper,
            ActionView::Helpers::UrlHelper,
            ActionView::Helpers::CaptureHelper,
            ActionView::Helpers::JavaScriptHelper
    
    attr_accessor :html, :javascript
  end
end
