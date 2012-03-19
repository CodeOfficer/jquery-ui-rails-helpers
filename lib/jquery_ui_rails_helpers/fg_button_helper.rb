# http://www.filamentgroup.com/examples/buttonFrameworkCSS/
# http://www.filamentgroup.com/lab/styling_buttons_and_toolbars_with_the_jquery_ui_css_framework/

module FgButtonHelper
  include JqueryUiRailsHelpers::UiHelper

  def fg_ui_button(opts={}, &block)
    # ui(opts, JqueryFgUiButton, &block)
  end
end

module FgButtonSetHelper
  include JqueryUiRailsHelpers::UiHelper

  def fg_ui_buttonset(opts={}, &block)
    # ui(opts, JqueryFgUiButtonSet, &block)
  end
end
