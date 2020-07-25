// Scroll Timer

var myDiv = $('');
    
$(window).scroll(function() {
  clearTimeout($.data(this, 'scrollTimer'));
  $.data(this, 'scrollTimer', setTimeout(function() {
    
    // User hasn't scolled in 3 seconds, do something.
    // console.log('Haven't scrolled in 3s!');
    
    myDiv.css('display', 'none');
  }, 3000));
});