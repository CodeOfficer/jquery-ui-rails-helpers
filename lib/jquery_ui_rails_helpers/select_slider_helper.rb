 # jQuery-Plugin - selectToUISlider - creates a UI slider component from a select element(s)
 # by Scott Jehl, scott@filamentgroup.com
 # http://www.filamentgroup.com
 # reference article: http://www.filamentgroup.com/lab/update_jquery_ui_16_slider_from_a_select_element/
 # demo page: http://www.filamentgroup.com/examples/slider_v2/index.html

require "jquery_ui_rails_helpers/jquery_ui_base"

module JqueryUI
  module SelectSliderHelper
    include JqueryUiRailsHelpers::UiHelper

    def ui_select_slider(opts={}, &block)
      ui(opts, JqueryUiSelectSlider, &block)
    end
    
    class JqueryUiSelectSlider < JqueryUiRailsHelpers::JqueryUiBase
      def initialize(opts={}, controller, &block)
        @html_options = { :id => :select_slider }.merge( opts[:html] )
        @ui_options = {}.merge opts[:ui]


        @labels = {}.merge get_labels(opts[:labels] || [])
        @range = opts[:range]

        @content = controller.capture(&block) if block_given?
        @content = @content || ""
      end

      def render
        @content = render_labels unless @labels.empty?

        unless @range
          @html = content_tag( :select, @content.html_safe, @html_options)
        else
          render_range_tags
          @html = content_tag( :select, @content_from.html_safe, @html_options.merge(id_from))
          @html << content_tag( :select, @content_to.html_safe, @html_options.merge(id_to))
        end

        # generate the javascript for jquery ui
        @javascript = javascript_tag "$(function(){ $('#%s').selectToUISlider(%s); });" % [@html_options[:id], @ui_options.to_json]

        # return self, for chaining
        self
      end

      protected

      def id_from
        {:id => @html_options[:id].to_s + '_from'}
      end

      def id_to
        {:id => @html_options[:id].to_s + '_to'}
      end

      def render_range_tags
        @content_from = render_labels @range.first
        @content_to = render_labels @range.last
      end

      def get_labels labels
        labels.kind_of?(Array) ? labels.inject({}){|res, val| res[val.to_s] = val.to_s; res} : labels
      end

      def render_labels selected = ''
        @labels.inject("") do |res, element|
          sel = (selected && element.last.to_s == selected.to_s)
          res << content_tag(:option, element.first.html_safe, {:value => element.last, :selected => sel})
        end
      end
    end
  end
end