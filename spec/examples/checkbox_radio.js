jQuery(function ($) {
  $('#log').dblclick(function () { $('#log').empty(); });
});

jQuery(function ($) {
  $('input[type=checkbox]').checkbox().bind('ui-checkbox-changed'
      +' ui-checkbox-enabled ui-checkbox-disabled'
      +' ui-checkbox-focus ui-checkbox-blur', 
  function (event, info) {
    $('#log').prepend('['+$(this).attr('id')+'] ' + $('label[for=' + $(this).attr('id') + ']').text() + ': ' + event.type 
      + '<br />');
  });
});

jQuery(function ($) {
  $('input[type=radio]').radiobutton().bind('ui-radiobutton-changed'
      +' ui-radiobutton-enabled ui-radiobutton-disabled'
      +' ui-radiobutton-focus ui-radiobutton-blur', 
  function (event, info) {
    $('#log').prepend('['+$(this).attr('id')+'] ' + $('label[for=' + $(this).attr('id') + ']').text() + ': ' + event.type 
      + '<br />');
  });
  
  $('input[type=radio][name=radiogroup3]').radiobutton('option', 'highlightGroup', true);
});