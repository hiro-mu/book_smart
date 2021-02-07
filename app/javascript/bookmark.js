$(function(){
  $("#bookmark").click(function(){
      var navClass = $(this).attr("class"),
          href = $(this).attr("href");
          $(href).fadeIn();
      $(this).addClass("open");
      return false;
  });
});