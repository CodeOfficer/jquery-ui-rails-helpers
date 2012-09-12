(function( $ ){
  $.fn.sweetDateRange = function( options ) {

    // Create some defaults, extending them with any options that were provided
    var settings = $.extend( {
    }, options);

    var fromInputId = this[0].id;
    var toInputId = this[1].id;

    var fromInput = $('#' + fromInputId);
    var toInput = $('#' + toInputId);

    $(this).daterangepicker($.extend(
      {
        onChange: function() {
          $.each([fromInput, toInput], function() {
            $this = $(this);
            var value = $this.val();
            var id = $this.attr('id');
            var label = $('label[for=' + id + ']'); // find label for input
            label.text(value); // update label value with input value
            $this.addClass('hidden'); // hide input
          })
        }
      }, settings)
    );
  }
})( jQuery );  