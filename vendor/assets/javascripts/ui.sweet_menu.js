var sweetMenu = {  
  activate: function(updaters) {
    this.activateInputs('input.ui-sweet', updaters);
    this.activateMenus('ul.ui-sweetmenu', updaters);
  },

  activateInputs: function(selector, updaters) {
    $(selector).blur(function() {    
      var inputElem = $(this);
      var id = inputElem.attr('id');

      var searcher = id.replace('search_', '');

      var updateFun = updaters[searcher];

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

      console.log('selectorId', selectorId);

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

      var searcher = selectorId.replace('search_', '');

      var updateFun = updaters[searcher];

      console.log('updaters', updaters, searcher, updateFun);

      if (typeof updateFun == 'function') {
        console.log('update call', searcher);
        updateFun(value);
      }

      var formatFun = updaters[searcher + 'Label'];

      if (typeof formatFun == 'function') {
        console.log('format call', searcher);
        text = formatFun(text);
      }

      label.text(text);
    });
  } 
}
