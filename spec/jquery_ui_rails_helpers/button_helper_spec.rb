require "spec_helper"

describe JqueryUI::ButtonHelper do
  include ControllerTestHelpers,
          JqueryUI::ButtonHelper

  it "should have a default display and label" do
    output = ui_button
    output.should == "<button id=\"button\">Press me!</button>"
  end

  it "should display the button text from block" do
    output = ui_button do
      "Hello"
    end
    output.should == "<button id=\"button\">Hello</button>"
  end

  it "should display the button text from label option" do
    output = ui_button :label => 'Bold'
    output.should == "<button id=\"button\">Bold</button>"
  end

  it "should set html options" do
    output = ui_button :html => { :id => 'blah', :class => 'foo' } do |widget|
      # empty for now
    end
    output.should == "<button class=\"foo\" id=\"blah\">Press me!</button>"
  end

  it "should set javascript for the default content identifier" do
    ui_button
    @_content_for[:jquery_ui_helpers].should include "$('#button').button({});"
  end

  it "should set javascript for a custom content identifier" do
    ui_button :script_for => :blah do
    end
    @_content_for[:blah].should include "$('#button').button({});"
  end

  it "should set javascript for icons config" do
    ui_button :ui => {:icons => {primary:'ui-icon-gear'}}

    @_content_for[:jquery_ui_helpers].should include "$('#button').button({\"icons\":{\"primary\":\"ui-icon-gear\"}});"
  end
end