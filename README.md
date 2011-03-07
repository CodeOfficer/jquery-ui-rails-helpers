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

Helps generate HTML for use with the jQuery UI Accordion plugin. (Examples are in HAML. http://haml-lang.com/)

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

Helps generate HTML for use with the jQuery UI Dialog plugin. (Examples are in HAML. http://haml-lang.com/)

    - ui_dialog :html => { :id => 'my_dialog', :title => 'Dialog Title' } do |widget|
      Dialog contents

The above will generate this HTML in your view:

    <div id="my_dialog" title="Dialog Title">
      Dialog contents
    </div>

Which you'll then work with in Javascript by the id:

    $('#my_dialog').dialog('open');

By default, dialogs will be set with "autoOpen: false". In its current form, what the dialog helper offers is perhaps not terribly useful in itself. When :ui parameters are supported, it ought to come into its own! 


Javascript Generation
---------------------

By default, Javascript for the generated HTML is saved via content_for to the identifier :jquery_ui_helpers. You can specify a custom identifier with 
the parameter :script_for

    - ui_tabs :script_for => :scripts do |widget|
      ...

You'll output that, at the bottom of the page beneath where you load jQuery, using:

    = yield :jquery_ui_helpers