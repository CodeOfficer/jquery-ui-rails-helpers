require "jquery_ui_rails_helpers/tree_helper"

module JqueryUI
  module MenuHelper
    include JqueryUiRailsHelpers::UiHelper
    include ::JqueryUI::TreeHelper

    def ui_menu(opts={}, &block)
      ui(opts, JqueryUiMenu, &block)
    end

    def ui_menu_item(opts={}, &block)
      ui(opts, JqueryUiMenuItem, &block)
    end
    
    class JqueryUiMenu < JqueryUI::TreeHelper::JqueryUiTree
      def initialize(opts={}, controller, &block)
        super
        @html_options = { :id => :menu }.merge( opts[:html] )
        @nested = opts[:nested]
      end

      def render
        super
      end

      def inner_struct
        nested? ? super : @content.html_safe        
      end      

      def set_javascript
        @javascript = javascript_tag "$(function(){ $('#%s').menu(%s); });" % [@html_options[:id], @ui_options.to_json]
      end

      def nested?
        @nested
      end
    end
    # also use with ui_branch and ui_leaf from tree

    class JqueryUiMenuItem < JqueryUiRailsHelpers::JqueryUiBase
      
      def initialize(opts={}, controller, &block)        
        @ui_options = {}.merge opts[:ui]
        @link = opts[:link]
        @link_options = @link.extract_options! if @link
        
        id = 'menu_item'       
        id += ('_' + opts[:label].downcase) if opts[:label]
        id += ('_' + @link_options[:id].downcase) if @link_options

        @html_options = { :id => id }.merge( opts[:html] )
        @label = opts[:label] || 'No item label' if !@link
        @content = ""
      end

      def render              
        add_label if @label
        add_link if @link

        @html = content_tag :li, @content.html_safe, @html_options
        self
      end

      protected

      def add_link        
        href = @link.size > 1 ? @link.last : @link.first
        label = @link.first
        options = @link_options.merge(:href => href)
        @content = content_tag(:a, label.html_safe, options)
      end

      def add_label
        @content = content_tag(:a, @label.html_safe, :href => '#')
      end
    end
  end
end