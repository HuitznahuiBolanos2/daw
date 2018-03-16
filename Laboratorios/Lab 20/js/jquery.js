// $(document).getElementById("submit").onclick(function(){alert("hola")});
$(document).ready(function() {
  $("#submit").click(function(){
    $("#div_accion").show(400).animate({top:"50%"},500).animate({left:"20px"},500);

  });
});
