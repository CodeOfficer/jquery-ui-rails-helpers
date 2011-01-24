require 'test_helper'

class TabsHelperTest < ActionView::TestCase

	context "creating tabs without a block syntax" do
		should 'raises an exception' do
      assert_raise ArgumentError do
        @tabs = tabs_for
      end
		end
	end

	context "creating one set of tabs" do
		setup do
			@tabs = tabs_for do |tab|
				tab.create('information', 'Information') { "Information blurbage." }
				tab.create('about_us', 'About Us')  { "About us blurbage." }
			end
		end

		should 'have proper dom structure' do
			render :text => @tabs
			assert_select "div[id='tabs']", 1
			assert_select "div[id='tabs'] ul", 1
			assert_select "div[id='tabs'] ul li", 2
			assert_select "div[id='tabs'] div[id='information']", 1
			assert_select "div[id='tabs'] div[id='about_us']", 1
		end
	end

end