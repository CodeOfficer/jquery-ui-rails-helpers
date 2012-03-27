require "spec_helper"

describe JqueryUI::TreeHelper do
  include ControllerTestHelpers,
          JqueryUI::TreeHelper

  it "should have a default display" do
    output = ui_tree
    output.should == "<ul id=\"tree\"></ul>"
  end

  it "should set html options" do
    output = ui_tree :html => { :id => 'blah', :class => 'foo' }
    output.should == "<ul class=\"foo\" id=\"blah\"></ul>"
  end

  it "should set javascript for the default content identifier" do
    ui_tree :ui => {:expanded => 'li:first'}
    @_content_for[:jquery_ui_helpers].should include "$('#tree').tree({\"expanded\":\"li:first\"});"
  end

  it "should nest a tree as html bullet list structure" do
    output = ui_leaf :label => 'Hello'
    output.should == "<li><a href=\"#\">Hello</a></li>"    
  end

  it "should display a simple branch node" do
    output = ui_branch :label => 'Hello'
    output.should == "<li><a href=\"#\">Hello</a></li>"    
  end

  it "should display a branch node with a leaf" do
    output = ui_branch :link => ['Google', 'www.google.com', {:id => 'google'}] do
      [ui_leaf(:label => 'Hello'), ui_leaf(:label => 'Bye')].join.html_safe
    end
    output.should == "<li><a href=\"www.google.com\" id=\"google\">Google</a><ul><li><a href=\"#\">Hello</a></li><li><a href=\"#\">Bye</a></li></ul></li>"
  end


  it "should nest a tree as html bullet list structure" do
    output = ui_tree :ui => {:expanded => 'li:first'} do
      ui_branch :link => ['Google', 'www.google.com', {:id => 'google'}] do
        ui_leaf :label => 'Goodbye'
      end
    end
    # puts output

    output.should == "<ul id=\"tree\"><li><ul><li><a href=\"www.google.com\" id=\"google\">Google</a><ul><li><a href=\"#\">Goodbye</a></li></ul></li></ul></li></ul>"
  end
end