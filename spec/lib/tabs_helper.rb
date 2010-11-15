require "spec_helper"

describe TabsHelper do
  include ActionView::Helpers
  include Haml::Helpers
  include TabsHelper, ActionView::Helpers::CaptureHelper,
  ActionView::Helpers::JavaScriptHelper
  

  # allow tabs.create to run by stubbing an output_buffer
  attr_accessor :output_buffer
  @output_buffer = ""
  
  # stub content_for for testing
  def content_for(name, content = nil, &block)
    # this doesn't exist, and causes errors
    @_content_for = {} unless defined? @_content_for
    # we've got to initialize this, so we can concat to it
    @_content_for[name] = '' if @_content_for[name].nil?
    # now the rest is the same as in rails
    content = capture(&block) if block_given?
    @_content_for[name] << content if content
    @_content_for[name] unless content
  end

  it "should be empty, with an empty block" do
    output = tabs_for do
    end
    output.should == "<div id=\"tabs\"><ul></ul></div>"
  end

  it "should be have one link, with one " do
    output = tabs_for do |tabs|
      tabs.create 'tab_one', 'Tab 1' do
        # empty for now
      end
    end
    output.should == "<div id=\"tabs\"><ul><li><a href=\"#tab_one\"><span>Tab 1</span></a></li></ul><div id=\"tab_one\"></div></div>"
  end

  it "should set html options" do
    output = tabs_for :html => { :id => 'blah', :class => 'foo' } do |tabs|
      tabs.create 'tab_one', 'Tab 1', :html => { :class => 'bar' } do
        # empty for now
      end
    end
    output.should == "<div class=\"foo\" id=\"blah\"><ul><li><a href=\"#tab_one\"><span>Tab 1</span></a></li></ul><div class=\"bar\" id=\"tab_one\"></div></div>"
  end

  it "should set javascript for the default content identifier" do
    tabs_for do
    end
    @_content_for[:jquery_ui_helpers].should include "$('#tabs').tabs();"
  end

  it "should set javascript for a custom content identifier" do
    tabs_for :script_for => :blah do
    end
    @_content_for[:blah].should include "$('#tabs').tabs();"
  end

end