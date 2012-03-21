module JqueryUiHelpers
  module Rails
    class Engine < ::Rails::Engine
    	initializer "setup for rails" do
    		puts "JqueryUiHelpers engine loaded"
    		JqueryUiHelpers::Rails::Engine.add_view_ext
      end

      def self.add_view_ext
				ActionView::Base.send :include, AccordionHelper
				ActionView::Base.send :include, AutocompleteHelper
				ActionView::Base.send :include, DialogHelper
				ActionView::Base.send :include, ProgressbarHelper
				ActionView::Base.send :include, SliderHelper
				ActionView::Base.send :include, SelectSliderHelper
				ActionView::Base.send :include, TabsHelper
				ActionView::Base.send :include, ButtonHelper
				ActionView::Base.send :include, DateRangeHelper
				ActionView::Base.send :include, TreeHelper
				ActionView::Base.send :include, FileinputHelper
				ActionView::Base.send :include, MenuHelper
			end

			def self.add_controller_ext
      	# ActionController::Base.send(:include, UiControllerExtensions)
      end				
    end
  end
end
