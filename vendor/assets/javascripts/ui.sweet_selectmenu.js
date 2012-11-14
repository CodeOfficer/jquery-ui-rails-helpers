// creates a ui.menu from a label and select!

(function( $ ){

  $.fn.sweetMenu = function( options ) {  

    // Create some defaults, extending them with any options that were provided
    var settings = $.extend( {
    }, options);

    return this.each(function() {        

      var $this = $(this);
      var id = $this.attr('id');
      var menuId = id + '_menu';

      var existBefore = $('ul#' + menuId).length;

      // console.log('existBefore', existBefore);

      if (existBefore)
        $('ul#' + menuId).remove();

      var listElem = '<ul id="' + menuId + '" class="ui-sweetmenu hidden"></ul>';

      $this.before(listElem);

      var menu = $('#' + menuId);

      var options = $this.children();
      options.each(function() {
        var option = $(this);        
        var value = option.val();
        var text = option.text();
        if (text.trim() == '') { text = value }
        var listItem = '<li><a href="#" data-value="' + value + '">' + text + '</a></li>';
        menu.append(listItem);
      });

      menu.menu();
      menu.hide();

      if (existBefore) {
        return;        
      }
      
      // find label for selector and link it to menu!
      var label = $('label[for=' + id + ']');
      label.addClass('ui-sweet');

      label.click(function() {

        var menuId = $(this).attr('for') + '_menu';
        var menu = $('ul#' + menuId);

        // toggle menu show/hide on click
        menu.toggleClass('hidden');
      });
    });

  };
})( jQuery );

var sweetMenu = {  
  activate: function(updaters) {
    this.activateInputs('input.ui-sweet', updaters);
    this.activateMenus('ul.ui-sweetmenu', updaters);
  },

  activateInputs: function(selector, updaters) {
    $(selector).blur(function() {    
      var inputElem = $(this);
      var id = inputElem.attr('id');
      var updateFun = updaters[id];

      if (typeof updateFun == 'function') {
        // console.log('call', id, inputElem, inputElem.val());
        updateFun(inputElem.val());
      }
    });
  },

  activateMenus: function(selector, updaters) {
    $(selector + ' li a').click(function() {
      var clickedItem = $(this);
      var menu = $(this).parent().parent();
      menu.toggleClass('hidden');
      var menuId = menu.attr('id');

      // var selectorId = $(menu).data('selector');
      var selectorId = menuId.replace('_menu', '');

      // label for selector      
      var label = $('label[for=' + selectorId + ']')

      var value = clickedItem.data('value');
      var text  = clickedItem.text();

      var selector = $('select#' + selectorId);

      if (selector) {
        selector.selectOptions(value, true);
        // console.log('set selector', selector, value);
      } else {
        // console.log('no selector for', selectorId);
      }

      var updateFun = updaters[selectorId];

      // console.log('updaters', updaters, selectorId, updateFun);

      if (typeof updateFun == 'function') {
        // console.log('call', selectorId);
        updateFun(value);
      }

      var formatFun = updaters[selectorId + 'Label'];

      if (typeof formatFun == 'function') {
        // console.log('call', selectorId);
        text = formatFun(text);
      }

      label.text(text);
    });
  } 
}
