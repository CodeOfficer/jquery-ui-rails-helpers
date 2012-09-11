require "jquery_ui_rails_helpers/jquery_ui_base"

[:tree, :branch, :leaf].each do |name|
  require "jquery_ui_rails_helpers/tree_helper/ui_#{name}"
end

class Array
  def safe_join
    self.join.html_safe
  end
end

module JqueryUI
  module TreeHelper
    include JqueryUiRailsHelpers::UiHelper

    def ui_tree(opts={}, &block)
      ui(opts, JqueryUiTree, &block)
    end

    def ui_branch(opts={}, &block)
      ui(opts, JqueryUiBranch, &block)
    end

    def ui_leaf(opts={}, &block)
      ui(opts, JqueryUiLeaf, &block)
    end    
  end
end