<?php
  /*if($_POST["user"] == "Huitznahui" && $_POST["password"] == "123456"){
    include("_header.html");
    include("_podcast.html");
    include("_footer.html");
  } else {
    header("location: login.php");
  }*/
  session_start();
  if(isset($_SESSION["user"])){
    include("_header.html");
    //$_SESSION["podcast"] = "hola";
    $user=$_SESSION["user"];
    include("_podcast.html");
    include("_footer.html");
  }else if ($_POST["user"]=="Huitznahui" && $_POST["password"]=="123456" ) {
        unset($_SESSION["error"]);
        $_SESSION["user"] = $_POST["user"];
        $_SESSION["podcast"] = "";
        $user = $_SESSION["user"];
        include("_header.html");
        include("_podcast.html");
        include("_footer.html");
    } else if($_POST["user"]!="Huitznahui" || $_POST["password"]!="123456") {
        $_SESSION["error"] = "Usuario y/o contraseña incorrectos";
        header("location: login.php");
    }
 ?>
