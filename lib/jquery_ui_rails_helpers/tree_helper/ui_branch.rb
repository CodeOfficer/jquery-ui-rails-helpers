module JqueryUI
  module TreeHelper
    class JqueryUiBranch < JqueryUiRailsHelpers::JqueryUiBase
      def initialize(opts={}, controller, &block)
        @html_options = opts[:html]
        @ui_options = {}.merge opts[:ui]
        @link = opts[:link]
        @label = opts[:label]
        @content = controller.capture(&block) if block_given?
        @block = block_given?
        @content = @content || ""
      end

      def render      
        add_link if @link
        add_label if @label

        # collect the html for our node
        @html = content_tag( :li, @content.html_safe, @html_options)
    
        # return self, for chaining
        self
      end

      protected

      def block?
        @block
      end

      def inner_content
        block? ? content_tag(:ul, @content.html_safe) : @content.html_safe      
      end

      def add_label
        @content = content_tag(:a, @label.html_safe, :href => '#') + inner_content
      end

      def add_link
        link_options = @link.extract_options!
        href = @link.size > 1 ? @link.last : @link.first
        label = @link.first
        options = link_options.merge(:href => href)
        @content = content_tag(:a, label.html_safe, options) + inner_content
      end
    end
  end
end
