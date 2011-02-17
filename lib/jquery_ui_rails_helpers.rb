# JqueryUiRailsHelpers
require "jquery_ui_rails_helpers/tabs_helper"
# Accordions helper not yet refactored
#require "jquery_ui_rails_helpers/accordions_helper"
require "rails"

module JqueryUiRailsHelpers
end

ActionView::Base.send :include, TabsHelper