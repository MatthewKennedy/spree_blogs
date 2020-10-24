jQuery(function() {
  $('#news-archive').find('ul').hide()
    
  $('#news-archive span').click(function() {  
    if ($(this).hasClass('open')) {
      $(this).toggleClass('open')
    } 
    else {
      $(this).toggleClass('open')
    }

    $(this).siblings('ul:first').toggle(); 
   });                           
});
