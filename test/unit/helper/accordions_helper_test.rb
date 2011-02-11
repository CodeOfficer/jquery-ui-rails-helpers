require 'test_helper'

class AccordionsHelperTest < ActionView::TestCase

	context "creating accordions without a block syntax" do
		should 'raises an exception' do
			assert_raise ArgumentError do
				@accordions = accordions_for
			end
		end
	end

	context "creating one set of accordions" do
		setup do
			@accordions = accordions_for do |accordion|
				accordion.create('accordion_one', 'One') { "Accordion One." }
				accordion.create('accordion_two', 'Two') { "Accordion Two." }
			end
		end

		should 'have proper dom structure' do
			render :text => @accordions
			assert_select "div[id='accordions']", 1
			assert_select "div[id='accordions'] h3[id='accordion_one']", 1
			assert_select "div[id='accordions'] h3[id='accordion_one'] a", {:count => 1, :text => "One"}
			assert_select "div[id='accordions'] h3[id='accordion_two']", 1
			assert_select "div[id='accordions'] h3[id='accordion_two'] a", {:count => 1, :text => "Two"}
			assert_select "div[id='accordions'] div", 2
		end
	end

end

# <div id="accordions">
#		<h3 id="accordion_one"><a href="#">One</a></h3>
#		<div>Accordion Two.</div>
#		<h3 id="accordion_two"><a href="#">Two</a></h3>
#		<div>Accordion One.</div>
# </div>
