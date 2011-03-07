require "spec_helper"

describe SliderHelper do
  include ActionView::Helpers,
          ActionView::Helpers::CaptureHelper,
          ActionView::Helpers::JavaScriptHelper,
          SliderHelper
  
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

  it "should have a default display" do
    output = ui_slider do
    end
    output.should == "<div id=\"slider\"></div>"
  end

  it "should set html options" do
    output = ui_slider :html => { :id => 'blah', :class => 'foo' } do |widget|
      # empty for now
    end
    output.should == "<div class=\"foo\" id=\"blah\"></div>"
  end

  it "should set javascript for the default content identifier" do
    ui_slider do
    end
    @_content_for[:jquery_ui_helpers].should include "$('#slider').slider();"
  end

  it "should set javascript for a custom content identifier" do
    ui_slider :script_for => :blah do
    end
    @_content_for[:blah].should include "$('#slider').slider();"
  end

end