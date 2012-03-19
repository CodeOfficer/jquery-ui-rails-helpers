require "jquery_ui_rails_helpers/jquery_ui_base"
# require 'active_support'

class Array
  def safe_join
    self.join.html_safe
  end
end

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

  
  class JqueryUiTree < JqueryUiRailsHelpers::JqueryUiBase
    def initialize(opts={}, controller, &block)
      @html_options = { :id => :tree }.merge( opts[:html] )
      @ui_options = {}.merge opts[:ui]
      @link = opts[:link]
      @root_options = opts[:root_opts]
      @branch_options = opts[:branch_opts]
      
      @content = controller.capture(&block) if block_given?
      @block = true if @content
      @content = @content || ""
    end

    def render
      # collect the html for our tabs

      @html = content_tag( :ul, inner_content, @html_options)
  
      # generate the javascript for jquery ui
      @javascript = javascript_tag "$(function(){ $('#%s').tree(%s); });" % [@html_options[:id], @ui_options.to_json]

      # return self, for chaining
      self
    end

    protected

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

  class JqueryUiBranch < JqueryUiRailsHelpers::JqueryUiBase
    def initialize(opts={}, controller, &block)
      @html_options = opts[:html]
      @ui_options = {}.merge opts[:ui]
      @link = opts[:link]
      @label = opts[:label]
      @content = controller.capture(&block) if block_given?
      @block = true if @content
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