// Demo stuff
$(function(){

  // Customize the themeswitcher element...
  $('#switcher').themeswitcher({onSelect:function(){
    $().trigger('ui-theme-switch');
  }});

  $("form#ui input").filter(":checkbox,:radio").checkbox();
  $("#ui-test3, #ui-radio3").checkbox("disable");
  $("#ui-test4").parent(".ui-checkbox").addClass("ui-state-highlight");
  $("#ui-radio4").parent(".ui-radio").addClass("ui-state-highlight");
  $("#ui-test5").parent(".ui-checkbox").addClass("ui-state-error");
  $("#ui-radio5").parent(".ui-radio").addClass("ui-state-error");
  //$("form#default input").filter(":checkbox,:radio").addClass("ui-checkbox");
  $("#default-test3, #default-radio3").attr("disabled","disabled");

  $("#toggle").click(function() {
    var jq = $("#ui-test3, #ui-radio3");
    if (jq.filter(":disabled").length)
      jq.checkbox("enable");
    else
      jq.checkbox("disable");
    return false;
  });

});
