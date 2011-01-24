require 'action_view'
require 'helpers/tabs_helper'
require 'helpers/accordions_helper'

module JqueryUiRailsHelpers
end

ActionView::Base.send(:include, TabsHelper)
ActionView::Base.send(:include, AccordionsHelper)