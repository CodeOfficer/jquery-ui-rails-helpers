require "jquery_ui_rails_helpers/tree_helper"

module JqueryUI
  module MenuHelper
    include JqueryUiRailsHelpers::UiHelper
    include ::JqueryUI::TreeHelper

    def ui_menu(opts={}, &block)
      ui(opts, JqueryUiMenu, &block)
    end
    
    class JqueryUiMenu < JqueryUI::TreeHelper::JqueryUiTree
      def initialize(opts={}, controller, &block)
        super
        @html_options = { :id => :menu }.merge( opts[:html] )
      end

      def render
        super
      end

      def set_javascript
        @javascript = javascript_tag "$(function(){ $('#%s').menu(%s); });" % [@html_options[:id], @ui_options.to_json]
      end
    end
    # use with ui_branch and ui_leaf from tree
  end
end