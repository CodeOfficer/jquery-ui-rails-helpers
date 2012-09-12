$(function(){
  $('.input_trigger').click(function() {
    var id = $(this).data('input');
    $(this).addClass('hidden');
    var target = $('#' + id);        
    target.toggleClass('hidden');
    target.focus();
  });

  $('input.search').blur(function() {
    var clickedItem = $(this);
    clickedItem.toggleClass('hidden');
    var id = clickedItem.data('trigger');
    var valueItem = $('#' + id);
    var value = clickedItem.val();
    var inputId = clickedItem.data('input');
    var inputField = $('#' + inputId);
    if (inputField) {
      inputField.val(value);
    }

    valueItem.text(value);
    valueItem.removeClass('hidden');
  });
  
  $('.period_trigger').click(function() {
    var id = $(this).data('input');
    $(this).addClass('hidden');
    var target = $('#' + id);        
    target.toggleClass('hidden');
    // target.focus();
  });
});