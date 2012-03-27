require "spec_helper"

describe JqueryUI::DateRangeHelper do
  include ControllerTestHelpers,
          JqueryUI::DateRangeHelper

  it "should have a default display" do
    output = ui_daterange
    output.should == "<input id=\"daterange\"></input>"
  end

  it "should set html options" do
    output = ui_daterange :html => { :id => 'blah', :class => 'foo' } do |widget|
      # empty for now
    end
    output.should == "<input class=\"foo\" id=\"blah\"></input>"
  end

  it "should set javascript for the default content identifier" do
    ui_daterange
    @_content_for[:jquery_ui_helpers].should include "$('#daterange').daterangepicker({});"
  end

  it "should set javascript for a custom content identifier" do
    ui_daterange :script_for => :blah do
    end
    @_content_for[:blah].should include "$('#daterange').daterangepicker({});"
  end

end