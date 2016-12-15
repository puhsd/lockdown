$(document).ready(function() {
  $("#element").bind("click", function(){
    
    $.ajax({
        url: "/link/"+$("#code").val()+".json",
        context: document.body
      }).done(function(data) {
        window.location.replace(data.url)
    });
  });
});
