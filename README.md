What Is It?
===========

It's a Ruby on Rails plugin that provides helpers that take some of the boilerplate out of generating HTML for use with jQuery UI. http://jqueryui.com/


TabsHelper
----------

Helps generate HTML for use with the jQuery UI Tabs plugin. (Examples are in HAML. http://haml-lang.com/)

    - ui_tabs do |widget|
    	- widget.tab('tab_one', 'Tab 1') do
        Tab contents
    	- widget.tab('tab_two', 'Tab 2') do
    	  Tab contents

The above will generate this HTML in your view:

    <div id="tabs">
      <ul>
        <li><a href="#tab_one"><span>Tab 1</span></a></li>
        <li><a href="#tab_two"><span>Tab 2</span></a></li>
      </ul>
      <div id="tab_one">
        Tab contents
      </div>
      <div id="tab_two">
        Tab contents
      </div>
    </div>
  
Tabs will be rendered in the order you create them.

You can pass HTML options to either the parent DIV or any individual tab's
DIV as you like ...

    - ui_tabs :html => { :id => 'special_tabs', :class => 'zippy' } do |tab|
    	- widget.tab 'tab_one', 'Tab 1', :html => { :style => 'background: #FFF' } do
        Tab contents

The default DOM ID for the parent div is ... id="tabs" ... unless you pass in an HTML
option with a different value.

Options for jQuery UI widgets will be passed in via a :ui parameter, but this isn't supported yet.


AccordionHelper
---------------

Helps generate HTML for use with the jQuery UI Accordion widget. (Examples are in HAML. http://haml-lang.com/)

Usage is identical to the Tabs helper.

    - ui_accordion do |widget|
    	- widget.pane('accordion_one', 'Accordion 1') do
        Accordion contents
    	- widget.pane('accordion_two', 'Accordion 2') do
    	  Accordion contents

The above will generate this HTML in your view:

    <div id="accordion">
      <h3>Accordion 1</h3>
      <div id="accordion_one">
        Accordion contents
      </div>
      <h3>Accordion 2</h3>
      <div id="accordion_two">
        Accordion contents
      </div>
    </div>


DialogHelper
---------------

Helps generate HTML for use with the jQuery UI Dialog widget. (Examples are in HAML. http://haml-lang.com/)

    - ui_dialog :html => { :id => 'my_dialog', :title => 'Dialog Title' } do |widget|
      Dialog contents

The above will generate this HTML in your view:

    <div id="my_dialog" title="Dialog Title">
      Dialog contents
    </div>

Which you'll then work with in Javascript by the id:

    $('#my_dialog').dialog('open');

By default, dialogs will be set with "autoOpen: false". In its current form, what the dialog helper offers is perhaps not terribly useful in itself. When :ui parameters are supported, it ought to come into its own! 


AutocompleteHelper
---------------

Helps generate HTML for use with the jQuery UI Autocomplete widget. (Examples are in HAML. http://haml-lang.com/)

    - ui_autocomplete

The above will generate this HTML in your view:

    <div id="autocomplete">
      <input type="text" />
    </div>

You can pass your own form field and other html in a block, but you should be sure to include an input of type text, as that's what the generated Javascript looks for.

    - ui_autocomplete :html => { :id => 'my_autocomplete' } do
      = text_field :post

The above will generate this HTML in your view:

    <div id="my_autocomplete">
      <input type="text" name="post" id="post" />
    </div>


Javascript Generation
---------------------

By default, Javascript for the generated HTML is saved via content_for to the identifier :jquery_ui_helpers. You can specify a custom identifier with 
the parameter :script_for

    - ui_tabs :script_for => :scripts do |widget|
      ...

You'll output that, at the bottom of the page beneath where you load jQuery, using:

    = yield :jquery_ui_helpers


Progressbar
-------------

Use it something like this:

  = ui_progressbar :html => {:id => 'uploader', :class => 'progress'}

It also supports the :ui options hash for advanced config.

Button
-------------

Use it something like this:

  = ui_button :ui => {:icons => {primary:'ui-icon-gear'}}

  = ui_button :label => 'Save'

  = ui_button do
    "Save me"
  end

It supports the :ui options hash for advanced config.

Button Set
-------------

Use it something like this:

  = ui_buttonset :labels => ['B', 'I']

  = ui_buttonset :labels => ['B', 'I'], :type => 'radio'

  = ui_buttonset :labels => ['B', 'I'], :type => 'checkbox', :selected => ['B']

It also supports the :ui options hash for advanced config. By default the type is 'radio'.


Slider
-------------

Use it something like this:

  = ui_slider :html => {:id => 'rooms_slider', :class => 'slider'}, :ui => {:animate => true}


SelectSlider
-------------

This helper uses the Filamentgroup SelectSlider, which sits on top of the jQuery UI Slider and enhances it with tooltips, labels and ARIA support etc.

You can use it something like this:

    = ui_select_slider :html => {:id => 'rooms', :class => 'slider rooms'}, :ui => {:labels => 5}, :labels => (1..5).to_a, :range => [1,3]

    = ui_select_slider :html => {:id => 'sqm', :class => 'slider sqm'}, :ui => {:labels => 3}, :labels => (1..10).to_a.map{|v| v*10}, :range => [30,60]

This will generate two SELECT tags, one with a postfix id of '_from' and the other '_to', fx in the example above id='rooms_from' and id='rooms_to'

You can do CSS tooltip customization. Here we want to make the tooltip more slim than the default 8 character width. For other style customizations, see 'ui_slider.extras.css'

    a#handle_rooms_to .ui-slider-tooltip,
    a#handle_rooms_from .ui-slider-tooltip {
      width: 1em !important;
      margin-left: 0;
    }

For more details see http://www.filamentgroup.com
Reference article: http://filamentgroup.com/lab/update_jquery_ui_slider_from_a_select_element_now_with_aria_support/

Github project: https://github.com/filamentgroup/jQuery-Slider

Demo page: http://www.filamentgroup.com/examples/slider_v2/index.html

DateRangePicker
------------

Here is an example of an JSON options struture that can be passed in (see http://filamentgroup.com/examples/daterangepicker_v2/index2.php)

        {
          presetRanges: [
            {text: 'Ad Campaign', dateStart: 'Today', dateEnd: '03/07/09' },
            {text: 'Spring Vacation', dateStart: '03/04/09', dateEnd: '03/08/09' },
            {text: 'Office Closed', dateStart: '04/04/09', dateEnd: '04/08/09' }
          ], 
          posX: null,
          posY: null,
          arrows: true, 
          dateFormat: 'M d, yy',
          rangeSplitter: 'to',
          datepickerOptions: {
            changeMonth: true,
            changeYear: true
          },
          onOpen:function(){ if(inframe){ $(window.parent.document).find('iframe:eq(1)').width(700).height('35em');} }, 
            onClose: function(){ if(inframe){ $(window.parent.document).find('iframe:eq(1)').width('100%').height('5em');} }
        } 

Tree
-----------

Examples:

    ui_tree :ui => {:expanded => 'li:first'}

    ui_branch :link => ['Google', 'www.google.com', {:id => 'google'}] do
      [
        ui_leaf(:label => 'Hello'), 
        ui_leaf(:label => 'Bye')
      ].safe_join
    end

    ui_tree :ui => {:expanded => 'li:first'} do
      ui_branch :link => ['Google', 'www.google.com', {:id => 'google'}] do
        ui_leaf :label => 'Goodbye'
      end
    end

Menu
------------

See spec/examples
Includes iPod "flyout" style menu.

      // MENUS      
    $('#flat').menu({ 
      content: $('#flat').next().html(), // grab content from this page
      showSpeed: 400 
    });
    
    $('#hierarchy').menu({
      content: $('#hierarchy').next().html(),
      crumbDefaultText: ' '
    });
    
    $('#hierarchybreadcrumb').menu({
      content: $('#hierarchybreadcrumb').next().html(),
      backLink: false
    });
    
    // or from an external source
    $.get('menuContent.html', function(data){ // grab content from another page
      $('#flyout').menu({ content: data, flyOut: true });
    });

Themeswitcher
------------

You might find this useful ;)

https://github.com/kristianmandrup/ui_themeswitcher
       
What's Next?
------------

The Filamentgroup has made some nice widgets. The SelectSlider is one such example. This gem should support more of these widgets ;)

https://github.com/filamentgroup/jQuery-Menu
https://github.com/filamentgroup/jQuery-Custom-Input
https://github.com/filamentgroup/jQuery-Tree-Control
https://github.com/filamentgroup/jQuery-Custom-File-Input
https://github.com/filamentgroup/jQuery-UI-Date-Range-Picker

http://www.filamentgroup.com/lab/styling_buttons_and_toolbars_with_the_jquery_ui_css_framework/

