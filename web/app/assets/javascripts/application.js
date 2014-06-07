//Follow Button Effect

$(document).ready(

  function iniciar(){
  $('.follow').on("click", function(){
    $('.follow').css('background-color','#34CF7A');
    $('.follow').html('<div class="icon-ok"></div> Following');
  });
  }

);

/*jQuery time*/
$(document).ready(function(){
  $("#accordian h3").click(function(){
    //slide up all the link lists
    $("#accordian ul ul").slideUp();
    //slide down the link list below the h3 clicked - only if its closed
    if(!$(this).next().is(":visible"))
    {
      $(this).next().slideDown();
    }
  });
});
