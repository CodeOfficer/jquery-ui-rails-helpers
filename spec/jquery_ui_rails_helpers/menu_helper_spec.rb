require "spec_helper"

describe MenuHelper do
  include ControllerTestHelpers,
          MenuHelper

  it "should have a default display" do
    output = ui_menu
    output.should == "<ul id=\"menu\"></ul>"
  end

  it "should set javascript for the default content identifier" do
    ui_menu :ui => {:maxHeight => 180}

    @_content_for[:jquery_ui_helpers].should include "$('#menu').menu({\"maxHeight\":180});"
  end

  it "should nest a tree as html bullet list structure" do
    output = ui_menu do
      ui_branch :link => ['Google', 'www.google.com', {:id => 'google'}] do
        ui_leaf :label => 'Goodbye'
      end
    end

    output.should == "<ul id=\"menu\"><li><ul><li><a href=\"www.google.com\" id=\"google\">Google</a><ul><li><a href=\"#\">Goodbye</a></li></ul></li></ul></li></ul>"
  end
end