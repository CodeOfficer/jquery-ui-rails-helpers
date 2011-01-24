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
			assert_select "div[id='tabs']"
			assert_select "div[id='tabs'] ul"
			assert_select "div[id='tabs'] ul li", 2
			assert_select "div[id='tabs'] div[id='information']"
			assert_select "div[id='tabs'] div[id='about_us']"

			assert_select "div[id='tabs']" do |outer_divs|
				outer_divs.each do |outer_div|
					assert_select outer_div, "ul", 1 do |uls|
						assert_select uls[0], "li", 2
					end
				end
			end
		end
	end

end