$(document).ready( function() {
  function rollFunc() {
    $(this).find('.are_you_sure').slideToggle();    
  }
  $('.confirmable').on("mouseenter", rollFunc)
              .on("mouseleave", rollFunc);
});