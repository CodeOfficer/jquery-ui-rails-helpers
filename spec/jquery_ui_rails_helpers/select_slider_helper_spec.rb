 # jQuery-Plugin - selectToUISlider - creates a UI slider component from a select element(s)
 # by Scott Jehl, scott@filamentgroup.com
 # http://www.filamentgroup.com
 # reference article: http://www.filamentgroup.com/lab/update_jquery_ui_16_slider_from_a_select_element/
 # demo page: http://www.filamentgroup.com/examples/slider_v2/index.html

require "spec_helper"

describe JqueryUI::SelectSliderHelper do
  include ControllerTestHelpers,
          JqueryUI::SelectSliderHelper

  it "should have a default display" do
    output = ui_select_slider
    output.should == "<select id=\"select_slider\"></select>"
  end

  it "should set html options" do
    output = ui_select_slider :html => { :id => 'blah', :class => 'foo' } do |widget|
      # empty for now
    end
    output.should == "<select class=\"foo\" id=\"blah\"></select>"
  end

  it "should set javascript for the default content identifier" do
    ui_select_slider :ui => {:labels => 7} do
    end
    @_content_for[:jquery_ui_helpers].should include "$('#select_slider').selectToUISlider({\"labels\":7});"
  end

  it "should set javascript for a custom content identifier" do
    output = ui_select_slider :html => {:id => 'rooms', :class => 'slider rooms'}, :ui => {:labels => 5}, :labels => (1..5).to_a, :range => [1,3], :script_for => :rooms
    output.should == "<select class=\"slider rooms\" id=\"rooms_from\"><option selected=\"selected\" value=\"1\">1</option><option value=\"2\">2</option><option value=\"3\">3</option><option value=\"4\">4</option><option value=\"5\">5</option></select><select class=\"slider rooms\" id=\"rooms_to\"><option value=\"1\">1</option><option value=\"2\">2</option><option selected=\"selected\" value=\"3\">3</option><option value=\"4\">4</option><option value=\"5\">5</option></select>"
    @_content_for[:rooms].should include "$('select#rooms_from, select#rooms_to').selectToUISlider({\"labels\":5});"
  end

  it "should set javascript for a custom content identifier" do
    ui_select_slider :ui => {hideSelect: true, scaleAndTics: false}, range: (1..3), :script_for => :blah
    @_content_for[:blah].should include "$('select#select_slider_from, select#select_slider_to').selectToUISlider({\"hideSelect\":true,\"scaleAndTics\":false});"
  end

  it "should set javascript for the default content identifier" do
    output = ui_select_slider :ui => {:labels => 7}, :labels => ['1', 2, 3] do
    end
    output.should == "<select id=\"select_slider\"><option value=\"1\">1</option><option value=\"2\">2</option><option value=\"3\">3</option></select>"
  end

  it "should set javascript for the default content identifier" do
    output = ui_select_slider :ui => {:labels => 7, hideSelect: true}, :labels => ['1', 2, 3], :range => [1,3] do
    end
    output.should == "<select id=\"select_slider_from\"><option selected=\"selected\" value=\"1\">1</option><option value=\"2\">2</option><option value=\"3\">3</option></select><select id=\"select_slider_to\"><option value=\"1\">1</option><option value=\"2\">2</option><option selected=\"selected\" value=\"3\">3</option></select>"
  end
end