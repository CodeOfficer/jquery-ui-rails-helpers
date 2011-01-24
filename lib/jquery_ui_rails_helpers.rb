require 'action_view'
require "jquery_ui_rails_helpers/version"
require 'helpers/javascripts_helper'
require 'helpers/tabs_helper'
require 'helpers/accordions_helper'

module JqueryUiRailsHelpers
end

ActionView::Base.send(:include, JavascriptsHelper)
ActionView::Base.send(:include, TabsHelper)
ActionView::Base.send(:include, AccordionsHelper)