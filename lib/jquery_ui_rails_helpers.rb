# JqueryUiRailsHelpers
require "jquery_ui_rails_helpers/tabs_helper"
require "jquery_ui_rails_helpers/accordion_helper"
require "jquery_ui_rails_helpers/dialog_helper"
require "rails"

module JqueryUiRailsHelpers
end

ActionView::Base.send :include, TabsHelper
ActionView::Base.send :include, AccordionHelper
ActionView::Base.send :include, DialogHelper