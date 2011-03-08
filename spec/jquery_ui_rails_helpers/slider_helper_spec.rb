require "spec_helper"

describe SliderHelper do
  include ControllerTestHelpers,
          SliderHelper

  it "should have a default display" do
    output = ui_slider
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