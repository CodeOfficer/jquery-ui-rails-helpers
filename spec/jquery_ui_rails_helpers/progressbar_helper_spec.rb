require "spec_helper"

describe ProgressbarHelper do
  include ControllerTestHelpers,
          ProgressbarHelper

  it "should have a default display" do
    output = ui_progressbar
    output.should == "<div id=\"progressbar\"></div>"
  end

  it "should set html options" do
    output = ui_progressbar :html => { :id => 'blah', :class => 'foo' } do |widget|
      # empty for now
    end
    output.should == "<div class=\"foo\" id=\"blah\"></div>"
  end

  it "should set javascript for the default content identifier" do
    ui_progressbar do
    end
    @_content_for[:jquery_ui_helpers].should include "$('#progressbar').progressbar();"
  end

  it "should set javascript for a custom content identifier" do
    ui_progressbar :script_for => :blah do
    end
    @_content_for[:blah].should include "$('#progressbar').progressbar();"
  end

end