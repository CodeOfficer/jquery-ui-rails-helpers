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
      var listElem = '<ul id="' + menuId + '" class="ui-sweetmenu hidden"></ul>';

      $this.before(listElem);

      var menu = $('#' + menuId);      

      // find label for selector and link it to menu!
      var label = $('label[for=' + id + ']');
      label.addClass('ui-sweet');

      label.click(function() {
        var menuId = $(this).attr('for') + '_menu';
        // toggle menu show/hide on click
        $('ul#' + menuId).toggleClass('hidden');
      });

      var options = $this.children();

      $this.children().each(function() {
        var option = $(this);        
        var value = option.val();
        var text = option.text();
        if (text.trim() == '') { text = value }
        var listItem = '<li><a href="#" data-value="' + value + '">' + text + '</a></li>';
        menu.append(listItem);
      });

      menu.menu();
      menu.hide();
    });

  };
})( jQuery );

var sweetMenu = {  
  activate: function(updaters) {
    $('ul.ui-sweetmenu li a').click(function() {
      var clickedItem = $(this);
      var menu = $(this).parent().parent();
      menu.toggleClass('hidden');
      var menuId = menu.attr('id');

      // var selectorId = $(menu).data('selector');
      var selectorId = menuId.replace('_menu', '');

      // label for selector      
      var label = $('label[for=' + selectorId + ']')

      var value = clickedItem.data('value');    

      var selector = $('#' + selectorId);
      if (selector) {
        selector.val(value);
      }

      var updateFun = updaters[selectorId];
      if (typeof updateFun == 'function') {
        updateFun(value);
      }

      label.text(value);
    });
  } 
}
