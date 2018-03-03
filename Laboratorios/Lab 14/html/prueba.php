<?php

    if ($_POST["name"]=="Huitznahui Bolanos" && $_POST["mail"]=="Huitz.B@hotmail.com" ) {
        include("_header.html");
        //echo "Bienvenido ".$_POST["name"];
        include("_ticket.html");
        include("_footer.html");
    } else {
      //echo "No se encontro nada";
      header("location: index.php");
    }

?>
