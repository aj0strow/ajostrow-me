jQuery ->
  $('.datepicker').datepicker({ dateFormat: 'yy-mm-dd' });
    
  $('.comment-textarea').focus ->
    $('.comment-btn').show().slow()
  $('.comment-textarea').blur ->
    $('.comment-btn').hide() unless $.trim $(this).val()
      
