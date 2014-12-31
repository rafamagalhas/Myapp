$(document).on('click', function(){
  $(".up-vote").click(function(){
    var answer_id = $(this).attr('data');
    $.post('/answers/'+answer_id+'/vote/up', function(data){
      $('#answer-balance-'+answer_id).text(data);
    });
  });
});

$(document).on('click', function(){
  $(".down-vote").click(function(){
    var answer_id = $(this).attr('data');
    $.post('/answers/'+answer_id+'/vote/down', function(data){
      $('#answer-balance-'+answer_id).text(data);
    });
  });
});