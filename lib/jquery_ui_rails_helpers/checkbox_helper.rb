require "jquery_ui_rails_helpers/jquery_ui_base"

module JqueryUI
  module CheckboxHelper
    include JqueryUiRailsHelpers::UiHelper

    def ui_checkboxes(opts={}, &block)
      ui(opts, JqueryUiCheckbox, &block)
    end

    def ui_checkbox(opts={}, &block)
      # wrap args using same api
      opts[:html] = opts[:html].merge(:id => :checkbox) if opts[:html]
      opts[:labels] = [opts[:label]]
      opts[:selected] = [opts[:label]] if opts[:selected]
      
      ui(opts, JqueryUiCheckbox, &block)
    end
    
    class JqueryUiCheckbox < JqueryUiRailsHelpers::JqueryUiBase
      def initialize(opts={}, controller, &block)
        @html_options = { :id => :checkboxes }.merge( opts[:html] )
        @ui_options = {}.merge opts[:ui]
        @labels   = opts[:labels] || []
        @type     = opts[:type] || 'checkbox'
        @selected = opts[:selected] || []
        @disabled = opts[:disabled] || false
        @content  = controller.capture(&block) if block_given?
        @content  = @content || ""
      end

      def render
        @content = render_labels(@selected) unless @labels.empty?
        # collect the html for our tabs
        @html = render_labels selected
    
        # generate the javascript for jquery ui
        @javascript = javascript_tag "$(function(){ $('#%s').checkbox(%s); });" % [@html_options[:id], @ui_options.to_json]

        # return self, for chaining
        self
      end

      def render_labels selected = ''
        index = 0
        @labels.inject("") do |res, label|
          index += 1
          checked = selected.include?(label.to_s)
          label_id = [@html_options[:id], @type, index.to_s].join '_'
          label_tag = content_tag :label, label, {:for => label_id}
          res << content_tag(:input, label_tag, {:id => label_id, :checked => checked, :type => @type, :disabled => @disabled})
        end
      end

    end    
  end
end