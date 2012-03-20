require "jquery_ui_rails_helpers/tree_helper"

module MenuHelper
  include JqueryUiRailsHelpers::UiHelper
  include TreeHelper

  def ui_menu(opts={}, &block)
    ui(opts, JqueryUiMenu, &block)
  end
  
  class JqueryUiMenu < ::TreeHelper::JqueryUiTree
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