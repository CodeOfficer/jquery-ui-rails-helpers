require "spec_helper"

describe AccordionHelper do
  include ControllerTestHelpers,
          AccordionHelper

  it "should be empty, with an empty block" do
    output = ui_accordion do
    end
    output.should == "<div id=\"accordion\"></div>"
  end

  it "should be have one link, with one " do
    output = ui_accordion do |widget|
      widget.panel 'pane_one', 'Pane 1' do
        # empty for now
      end
    end
    output.should == "<div id=\"accordion\"><h3><a href=\"#pane_one\"><span>Pane 1</span></a></h3><div id=\"pane_one\"></div></div>"
  end

  it "should set html options" do
    output = ui_accordion :html => { :id => 'blah', :class => 'foo' } do |widget|
      widget.panel 'pane_one', 'Pane 1', :html => { :class => 'bar' } do
        # empty for now
      end
    end
    output.should == "<div class=\"foo\" id=\"blah\"><h3><a href=\"#pane_one\"><span>Pane 1</span></a></h3><div class=\"bar\" id=\"pane_one\"></div></div>"
  end

  it "should set javascript for the default content identifier" do
    ui_accordion do
    end
    @_content_for[:jquery_ui_helpers].should include "$('#accordion').accordion();"
  end

  it "should set javascript for a custom content identifier" do
    ui_accordion :script_for => :blah do
    end
    @_content_for[:blah].should include "$('#accordion').accordion();"
  end

end