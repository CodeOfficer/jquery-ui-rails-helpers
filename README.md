What Is It?
===========

It's a Ruby on Rails plugin that provides helpers that take some of the boilerplate out of generating HTML for use with jQuery UI. http://jqueryui.com/

Currently, only Tabs is fully implemented, but I'll start simple implementations of other widgets soon.

TabsHelper
----------

Helps generate HTML for use with the jQuery UI Tabs plugin. (Examples are in HAML, because your views should be in HAML. http://haml-lang.com/)

    - tabs_for do |tab|
    	- tab.create('tab_one', 'Tab 1') do
        Tab contents
    	- tab.create('tab_two', 'Tab 2') do
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

    - tabs_for :html => { :class => 'zippy' } do |tab|
    	- tab.create 'tab_one', 'Tab 1', :html => { :style => 'background: #FFF' } do
        Tab contents

The default DOM ID for the parent div is ... id="tabs" ... unless you pass in an HTML
option with a different value.

Options for jQuery UI widgets will be passed in via a :ui parameter, but this isn't supported yet.


AccordionHelper
---------------

Helps generate HTML for use with the jQuery UI Accordion plugin. (Examples are in HAML, because your views should be in HAML. http://haml-lang.com/)

Usage is identical to the Tabs helper. *I have not yet refactored AccordionHelper, so don't expect it to work! Also, expect 
the helper name to change from "accordions_for" to "accordion_for", as the name of the jQuery UI widget is singular. -michaek*

    - accordions_for do |accordion|
    	- accordion.create('accordion_one', 'Accordion 1') do
        Accordion contents
    	- accordion.create('accordion_two', 'Accordion 2') do
    	  Accordion contents


Javascript Generation
---------------------

By default, Javascript for the generated HTML is saved via content_for to the identifier :jquery_ui_helpers. You can specify a custom identifier with 
the parameter :script_for

    - tabs_for :script_for => :scripts do |tab|
      ...
