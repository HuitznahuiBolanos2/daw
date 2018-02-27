<?php

/*include("_header.html");
include("_login.html");
include("_footer.html");*/
session_start();
if(isset($_SESSION["user"])){
  header("location:home.php");

}else{
  include("_header.html");
  include("_login.html");
  include("_footer.html");
}

?>
