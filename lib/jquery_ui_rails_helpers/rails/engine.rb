module JqueryUiHelpers
  module Rails
    class Engine < ::Rails::Engine
    	initializer "setup for rails" do
    		# puts "JqueryUiHelpers engine loaded"
    		JqueryUiHelpers::Rails::Engine.add_view_ext
      end

      def self.add_view_ext
      	helpers.each do |helper|
					ActionView::Base.send :include, "JqueryUI::#{helper}".constantize
				end
			end

			def self.helpers
      	[
      		:AccordionHelper, :AutocompleteHelper, :DialogHelper, :ProgressbarHelper, 
      		:SliderHelper, :SelectSliderHelper, :TabsHelper, :ButtonHelper, :DateRangeHelper, 
      		:TreeHelper, :FileinputHelper, :MenuHelper
      	]
			end				

			def self.add_controller_ext
      	# ActionController::Base.send(:include, UiControllerExtensions)
      end				
    end
  end
end
