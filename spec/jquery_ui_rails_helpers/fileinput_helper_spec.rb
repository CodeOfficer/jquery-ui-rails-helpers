require "spec_helper"

describe JqueryUI::FileinputHelper do
  include ControllerTestHelpers,
          JqueryUI::FileinputHelper

  it "should have a default display" do
    output = ui_fileinput
    output.should == "<input id=\"fileinput\" type=\"file\"></input>"
  end

  it "should set html options" do
    output = ui_fileinput :html => { :id => 'blah', :class => 'foo' } do |widget|
      # empty for now
    end
    output.should == "<input class=\"foo\" id=\"blah\" type=\"file\"></input>"
  end

  it "should set javascript for the default content identifier" do
    ui_fileinput
    @_content_for[:jquery_ui_helpers].should include "$('#fileinput').customFileInput({});"
  end

  it "should set javascript for a custom content identifier" do
    ui_fileinput :script_for => :blah
    @_content_for[:blah].should include "$('#fileinput').customFileInput({});"
  end
end