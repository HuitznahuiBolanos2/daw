<?php
  require_once "modelo.php";

  delete_by_name($_POST["podi"]);

  header("location:home.php");

 ?>
