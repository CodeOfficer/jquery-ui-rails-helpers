require "spec_helper"

describe JqueryUI::MenuHelper do
  include ControllerTestHelpers,
          JqueryUI::MenuHelper

  it "should have a default display" do
    output = ui_menu
    output.should == "<ul id=\"menu\"></ul>"
  end

  it "should set javascript for the default content identifier" do
    ui_menu :ui => {:maxHeight => 180}

    @_content_for[:jquery_ui_helpers].should include "$('#menu').menu({\"maxHeight\":180});"
  end

  it "should nest a simple one-level menu using labels" do
    output = ui_menu do
      [ui_menu_item(:label => 'Hello'), ui_menu_item(:label => 'Goodbye')].safe_join
    end

    output.should == "<ul id=\"menu\"><li id=\"menu_item_hello\"><a href=\"#\">Hello</a></li><li id=\"menu_item_goodbye\"><a href=\"#\">Goodbye</a></li></ul>"
  end

  it "should nest a simple one-level menu using links" do
    output = ui_menu do
      [
        ui_menu_item(:link => ['Google', 'www.google.com', {:id => 'google'}]), 
        ui_menu_item(:link => ['Rails', 'www.rails.com', {:id => 'rails'}]), 
      ].safe_join
    end

    output.should == "<ul id=\"menu\"><li id=\"menu_item_google\"><a href=\"www.google.com\" id=\"google\">Google</a></li><li id=\"menu_item_rails\"><a href=\"www.rails.com\" id=\"rails\">Rails</a></li></ul>"
  end

  it "should nest a tree as html bullet list structure" do
    output = ui_menu :nested => true do
      ui_branch :link => ['Google', 'www.google.com', {:id => 'google'}] do
        ui_leaf :label => 'Goodbye'
      end
    end

    output.should == "<ul id=\"menu\"><li><ul><li><a href=\"www.google.com\" id=\"google\">Google</a><ul><li><a href=\"#\">Goodbye</a></li></ul></li></ul></li></ul>"
  end
end