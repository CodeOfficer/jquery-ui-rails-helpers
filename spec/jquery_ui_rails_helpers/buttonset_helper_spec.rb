require "spec_helper"

describe ButtonSetHelper do
  include ControllerTestHelpers,
          ButtonSetHelper

  it "should have a default display" do
    output = ui_buttonset
    output.should == "<button id=\"buttonset\"></button>"
  end

  it "should set html options" do
    output = ui_buttonset :html => { :id => 'blah', :class => 'foo' } do |widget|
      # empty for now
    end
    output.should == "<button class=\"foo\" id=\"blah\"></button>"
  end

  it "should set javascript for the default content identifier" do
    ui_buttonset
    @_content_for[:jquery_ui_helpers].should include "$('#buttonset').buttonset({});"
  end


  it "should set javascript for icons config" do
    ui_buttonset :ui => {:icons => {primary:'ui-icon-gear'}}
    @_content_for[:jquery_ui_helpers].should include "$('#buttonset').buttonset({\"icons\":{\"primary\":\"ui-icon-gear\"}});"
  end

  it "should set radio labels in html" do
    output = ui_buttonset :labels => ['B', 'I']
    output.should == "<button id=\"buttonset\"><input id=\"buttonset_radio_1\" type=\"radio\"><label for=\"buttonset_radio_1\">B</label></input><input id=\"buttonset_radio_2\" type=\"radio\"><label for=\"buttonset_radio_2\">I</label></input></button>"
  end  

  it "should set checkbox labels in html and check selected" do
    output = ui_buttonset :labels => ['B', 'I'], :type => 'checkbox', :selected => ['B']
    output.should == "<button id=\"buttonset\"><input checked=\"checked\" id=\"buttonset_checkbox_1\" type=\"checkbox\"><label for=\"buttonset_checkbox_1\">B</label></input><input id=\"buttonset_checkbox_2\" type=\"checkbox\"><label for=\"buttonset_checkbox_2\">I</label></input></button>"
  end  

  it "should wrap with red toolbar" do
    output = ui_buttonset :labels => ['B', 'I'], :type => 'checkbox', :selected => ['B'], :toolbar => {:class => 'red'}
    output.should == "<span class=\"ui-widget-header ui-corner-all red\"><button id=\"buttonset\"><input checked=\"checked\" id=\"buttonset_checkbox_1\" type=\"checkbox\"><label for=\"buttonset_checkbox_1\">B</label></input><input id=\"buttonset_checkbox_2\" type=\"checkbox\"><label for=\"buttonset_checkbox_2\">I</label></input></button></span>"
  end  
end