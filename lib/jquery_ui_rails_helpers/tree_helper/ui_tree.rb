module JqueryUI
  module TreeHelper
    class JqueryUiTree < JqueryUiRailsHelpers::JqueryUiBase
      def initialize(opts={}, controller, &block)
        @html_options = { :id => :tree }.merge( opts[:html] )
        @ui_options = {}.merge opts[:ui]
        @link = opts[:link]
        @root_options = opts[:root_opts]
        @branch_options = opts[:branch_opts]
        
        @content = controller.capture(&block) if block_given?
        @block = block_given?
        @content = @content || ""
      end

      def render
        # collect the html for our tabs

        @html = content_tag( :ul, inner_content, @html_options)
    
        # generate the javascript for jquery ui
        set_javascript

        # return self, for chaining
        self
      end

      protected

      def set_javascript
        @javascript = javascript_tag "$(function(){ $('#%s').tree(%s); });" % [@html_options[:id], @ui_options.to_json]
      end

      def block?
        @block
      end

      def inner_content
        block? ? inner_struct : @content.html_safe      
      end

      def inner_struct
        ul = link_label + content_tag( :ul, @content, @branch_options)
        li = content_tag( :li, ul.html_safe, @root_options)
        li.html_safe
      end

      def link_label
        return '' if !@link || @link.empty?
        link_options = @link.extract_options!
        href = @link.size > 1 ? @link.last : @link.first
        label = @link.first
        options = link_options.merge(:href => href)
        content_tag(:a, label.html_safe, options)
      end
    end
  end
end

