module JqueryUI
  module TreeHelper
    class JqueryUiLeaf < JqueryUiBranch
      def initialize(opts={}, controller)
        @html_options = opts[:html]
        @ui_options = {}.merge opts[:ui]
        @link = opts[:link]
        @label = opts[:label] || 'No leaf label' if !@link
        @content = ""
      end

      def render      
        add_link if @link
        add_label if @label

        # collect the html for our tabs
        @html = content_tag( :li, @content.html_safe, @html_options)
    
        # return self, for chaining
        self
      end
    end
  end
end