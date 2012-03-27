require "jquery_ui_rails_helpers/jquery_ui_base"

module JqueryUI
  module ButtonHelper
    include JqueryUiRailsHelpers::UiHelper

    def ui_button(opts={}, &block)
      ui(opts, JqueryUiButton, &block)
    end
    
    class JqueryUiButton < JqueryUiRailsHelpers::JqueryUiBase
      def initialize(opts={}, controller, &block)
        @html_options = { :id => :button }.merge( opts[:html] )
        @ui_options = {}.merge opts[:ui]
        @content = controller.capture(&block) if block_given?
        @content = @content || opts[:label] || "Press me!"
      end

      def render
        # collect the html for our tabs
        @html = content_tag( :button, @content.html_safe, @html_options)
    
        # generate the javascript for jquery ui
        @javascript = javascript_tag "$(function(){ $('#%s').button(%s); });" % [@html_options[:id], @ui_options.to_json]

        # return self, for chaining
        self
      end

    end
  end

  module ButtonSetHelper
    include JqueryUiRailsHelpers::UiHelper

    def ui_buttonset(opts={}, &block)
      ui(opts, JqueryUiButtonSet, &block)
    end
    
    class JqueryUiButtonSet < JqueryUiRailsHelpers::JqueryUiBase
      def initialize(opts={}, controller, &block)
        @html_options = { :id => :buttonset }.merge( opts[:html] )
        @ui_options = {}.merge opts[:ui]
        @labels   = opts[:labels] || []
        @type     = opts[:type] || 'radio'
        @toolbar  = {}.merge(opts[:toolbar] || {})
        @selected = opts[:selected] || []
        @content  = controller.capture(&block) if block_given?
        @content  = @content || ""
      end

      def render
        @content = render_labels(@selected) unless @labels.empty?
        # collect the html for our tabs
        @html = content_tag( :button, @content.html_safe, @html_options)

        render_toolbar unless @toolbar.empty?
    
        # generate the javascript for jquery ui
        @javascript = javascript_tag "$(function(){ $('#%s').buttonset(%s); });" % [@html_options[:id], @ui_options.to_json]

        # return self, for chaining
        self
      end

      def render_toolbar
        clz = "ui-widget-header ui-corner-all #{@toolbar[:class]}"
        @html = content_tag(:span, @html, {:class => clz})
      end

      def render_labels selected = ''
        index = 0
        @labels.inject("") do |res, label|
          index += 1
          checked = selected.include?(label.to_s)
          label_id = [@html_options[:id], @type, index.to_s].join '_'
          label_tag = content_tag :label, label, {:for => label_id}
          res << content_tag(:input, label_tag, {:id => label_id, :checked => checked, :type => @type})
        end
      end

    end    
  end
end