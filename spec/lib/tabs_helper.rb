require "spec_helper"

describe TabsHelper do
  include ActionView::Helpers
  include Haml::Helpers
  include TabsHelper

  # allow tabs.create to run by stubbing an output_buffer
  attr_accessor :output_buffer
  @output_buffer = ""

  it "should be empty, with an empty block" do
    output = tabs_for do
    end
    output.should == "<div id=\"tabs\"></div>"
  end

  it "should be have one link, with one " do
    output = tabs_for do |tabs|
      tabs.create 'tab_one', 'Tab 1' do
        # empty for now
      end
    end
    output.should == "<div id=\"tabs\"><li><a href=\"#tab_one\"><span>Tab 1</span></a></li><div id=\"tab_one\"></div></div>"
  end
end