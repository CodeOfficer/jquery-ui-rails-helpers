require "spec_helper"

describe JqueryUI::TabsHelper do
  include ControllerTestHelpers,
          JqueryUI::TabsHelper

  it "should be empty, with an empty block" do
    output = ui_tabs do
    end
    output.should == "<div id=\"tabs\"><ul></ul></div>"
  end

  it "should be have one link, with one " do
    output = ui_tabs do |widget|
      widget.tab 'tab_one', 'Tab 1' do
        # empty for now
      end
    end
    output.should == "<div id=\"tabs\"><ul><li><a href=\"#tab_one\"><span>Tab 1</span></a></li></ul><div id=\"tab_one\"></div></div>"
  end

  it "should set html options" do
    output = ui_tabs :html => { :id => 'blah', :class => 'foo' } do |widget|
      widget.tab 'tab_one', 'Tab 1', :html => { :class => 'bar' } do
        # empty for now
      end
    end
    output.should == "<div class=\"foo\" id=\"blah\"><ul><li><a href=\"#tab_one\"><span>Tab 1</span></a></li></ul><div class=\"bar\" id=\"tab_one\"></div></div>"
  end

  it "should set javascript for the default content identifier" do
    ui_tabs do
    end
    @_content_for[:jquery_ui_helpers].should include "$('#tabs').tabs();"
  end

  it "should set javascript for a custom content identifier" do
    ui_tabs :script_for => :blah do
    end
    @_content_for[:blah].should include "$('#tabs').tabs();"
  end

end