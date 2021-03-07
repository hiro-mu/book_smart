$(function(){
  $("#bookmark").click(function(){
    href = $(this).attr("href");
    $(href).fadeIn();
    return false;
  });
});