require 'test_helper'

class TabsHelperTest < ActionView::TestCase

	context "creating tabs without a block syntax" do
		should 'raises an exception' do
			assert_raise ArgumentError do
				@tabs = tabs_for
			end
		end
	end

	context "creating two tabs" do
		setup do
			@tabs = tabs_for do |tab|
				tab.create('tab_one', 'One') { "Tab One." }
				tab.create('tab_two', 'Two') { "Tab Two." }
			end
		end

		should 'have proper dom structure' do
			render :text => @tabs
			assert_select "div[id='tabs']", 1
			assert_select "div[id='tabs'] ul", 1
			assert_select "div[id='tabs'] ul li", 2
			assert_select "div[id='tabs'] div[id='tab_one']", 1
			assert_select "div[id='tabs'] div[id='tab_two']", 1
		end
	end

	context "creating custom tabs" do
		setup do
			@tabs = tabs_for(:id => "my_tabs") do |tab|
				tab.create_ajax('http://www.codeofficer.com/', 'Ajax')
			end
		end

		should 'allow overriding the outter divs id' do
			render :text => @tabs
			assert_select "div[id='my_tabs']", 1
		end

		should 'allow ajaxed tabs' do
			render :text => @tabs
			assert_select "div[id='my_tabs'] ul li a[href='http://www.codeofficer.com/']", 1
			assert_select "div[id='my_tabs'] div", 0
		end
	end

end

# <div id="tabs">
#		<ul>
#			<li><a href="#tab_one"><span>One</span></a></li>
#			<li><a href="#tab_two"><span>Two</span></a></li>
#			<li><a href="http://www.codeofficer.com/"><span>Ajax</span></a></li>
#		</ul>
#		<div id="tab_one">Tab One.</div>
#		<div id="tab_two">Tab Two.</div>
# </div>