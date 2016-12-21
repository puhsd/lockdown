$(document).ready(function() {
  $("#element").bind("click", function(){

    $.ajax({
        url: "/link/"+$("#code").val()+".js?callback=",
        context: document.body,
        dataType: 'jsonp',
      }).done(function(data) {
        window.location.replace(data.url)
    });
  });
});
