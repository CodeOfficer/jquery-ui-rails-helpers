require "spec_helper"

describe AutocompleteHelper do
  include ControllerTestHelpers,
          AutocompleteHelper

  it "should be empty, with an empty block" do
    output = ui_autocomplete
    output.should == "<div id=\"autocomplete\"><input type=\"text\" /></div>"
  end

  it "should be able to override default input" do
    output = ui_autocomplete do |widget|
      tag(:input, :type => 'text', :class => 'completion')
    end
    output.should == "<div id=\"autocomplete\"><input class=\"completion\" type=\"text\" /></div>"
  end

  it "should set html options" do
    output = ui_autocomplete :html => { :id => 'blah', :class => 'foo' } do |widget|
      # empty for now
    end
    output.should == "<div class=\"foo\" id=\"blah\"><input type=\"text\" /></div>"
  end

  it "should set javascript for the default content identifier" do
    ui_autocomplete do
    end
    @_content_for[:jquery_ui_helpers].should include "$('#autocomplete input:text').autocomplete();"
  end

  it "should set javascript for a custom content identifier" do
    ui_autocomplete :script_for => :blah do
    end
    @_content_for[:blah].should include "$('#autocomplete input:text').autocomplete();"
  end

end