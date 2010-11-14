require "jquery_ui_rails_helpers"
require "jquery_ui_rails_helpers/tabs_helper"
# Accordions helper not yet refactored
#require "jquery_ui_rails_helpers/accordions_helper"
require "rails"

module JqueryUiRailsHelpers
  class Railtie < Rails::Railtie
    initializer 'jquery_ui_rails_helpers.initialize', :after => :after_initialize do
      ActionView::Base.send :include, TabsHelper
    end
  end
end
