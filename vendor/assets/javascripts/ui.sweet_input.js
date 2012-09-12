(function( $ ){
  $.fn.sweetInput = function( options ) {

    // Create some defaults, extending them with any options that were provided
    var settings = $.extend( {
    }, options);

    return this.each(function() {        
      var $this = $(this);
      var id = $this.attr('id');
      $this.addClass('hidden');

      var label = $('label[for=' + id + ']');
      label.addClass('ui-sweet'); 

      label.click(function() {
        var inputId = $(this).attr('for');
        $(this).addClass('hidden');
        var input = $('#' + inputId);
        input.removeClass('hidden');
        input.focus();
      });

      $this.blur(function() {
        var $this = $(this);
        $this.toggleClass('hidden');

        var id = $this.attr('id');
        var label = $('label[for=' + id + ']');
        
        var value = $this.val();
        label.text(value);
        label.toggleClass('hidden');
      });      
    })
  }
})( jQuery );  