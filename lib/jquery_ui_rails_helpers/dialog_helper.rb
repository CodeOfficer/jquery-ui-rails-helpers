require "jquery_ui_rails_helpers/jquery_ui_base"

module DialogHelper
  include JqueryUiRailsHelpers::UiHelper

  def ui_dialog(opts={}, &block)
    ui(opts, JqueryUiDialog, &block)
  end
  
  class JqueryUiDialog < JqueryUiRailsHelpers::JqueryUiBase
    def initialize(opts={}, controller, &block)
      @html_options = { :id => :dialog, :title => "" }.merge( opts[:html] )
      @content = controller.capture(&block) if block_given?
      @content = @content || ""
    end

    def render
      # collect the html for our tabs
      @html = content_tag( :div, @content.html_safe, @html_options)
  
      # generate the javascript for jquery ui
      @javascript = javascript_tag "$(function(){ $('#%s').dialog({ autoOpen: false }); });" % @html_options[:id]

      # return self, for chaining
      self
    end

  end
  
end