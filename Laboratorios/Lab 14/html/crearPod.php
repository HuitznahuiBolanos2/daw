<?php
session_start();
//echo "hola";
  if(isset($_SESSION["user"]) ) {
      if(isset($_POST["podcast"])){
      echo "Si recibe un nombre de podcast";



        unset($_SESSION["error_archivo"]);
        $target_dir = "uploads/";
        $target_dir = "uploads/";
        $target_file = $target_dir . basename($_FILES["imagen"]["name"]);
        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

        $check = getimagesize($_FILES["imagen"]["tmp_name"]);
        if($check !== false) {
          echo "File is an image - " . $check["mime"] . ".";
          $uploadOk = 1;
        } else {
          $_SESSION["error_archivo"] = "El archivo no es una imagen";
          $uploadOk = 0;
        }

        if (file_exists($target_file)) {
            $_SESSION["error_archivo"] =  "El archivo ya existe";
            $uploadOk = 0;
        }


        if ($_FILES["imagen"]["size"] > 500000) {
            $_SESSION["error_archivo"] =  "El archivo es demasiado grande.";
            $uploadOk = 0;
        }


        if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" ) {
            $_SESSION["error_archivo"] = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
            $uploadOk = 0;
        }

        if ($uploadOk == 0) {
            echo "No se pudo subir el Podcast.";
        } else {
            if (move_uploaded_file($_FILES["imagen"]["tmp_name"], $target_file)) {
                echo "The file ". basename( $_FILES["imagen"]["name"]). " has been uploaded.";
                 $_SESSION["ruta_archivo"] = $target_file;
            } else {
                $_SESSION["error_archivo"] =  "Error en la operación.";
            }
        }


        if(isset($_SESSION["error_archivo"])) {
            $_SESSION["error_archivo"] = "Si se esta procesando el archivo";
            header("location:add.php");
        }
        $_SESSION["archivo"] = $target_file;
        $_SESSION["podcast"] = $_POST["podcast"];
        header("location:login.php");
    } else {
        $_SESSION["error_archivo"] = "No se esta procesando el archivo";
        header("location:add.php");
    }
  } else {
    header("location:home.php");
  }
//}
  /*if(isset($_SESSION["user"])){
    if(isset($_POST["podcast"])){
      echo "hay un Podcast";
      $_SESSION["podcast"]=$_POST["podcast"];
      $_SESSION["podcast"];
      echo ($_SESSION["podcast"]);
    }
  }*/
 ?>
