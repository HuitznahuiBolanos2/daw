<?php
  function connect(){
    $mysql=mysqli_connect("localhost","root","","podcast");
    $mysql->set_charset("utf8");
    return $mysql;
  }
  function disconnect($mysql) {
      mysqli_close($mysql);
  }

  function login($user,$passw){
    $db = connect();
    if($db!=NULL){
      $query= 'SELECT nombre FROM usuario WHERE nombre="'.$user.
                '" AND password="'.$passw.'"';
      //$query= 'SELECT nombre FROM usuario WHERE nombre=".$user." AND password=".$passw." ';
      $query;
      $results = $db->query($query);
       // cycle to explode every line of the results
      // echo
      if (mysqli_num_rows($results) > 0)  {
          // it releases the associated results
          mysqli_free_result($results);
          disconnect($db);
          return true;
      }
      return false;
    }
    return false;
  }

  function getPodcasts(){
    $db = connect();
    if($db != NULL){
      $query = 'SELECT * FROM podcasts';
      $query;
      $results = $db->query($query);
      disconnect($db);

      return $results;
    }
    return true;
  }


  function ultimaPodcastAgr(){
    $db = connect();
    if($db != NULL){
      $query = 'SELECT * FROM podcasts ORDER BY id DESC LIMIT 1';
      $query;
      $results = $db->query($query);
      disconnect($db);
      return $results;
    }
  }

  function crearPodcast($nombrePod, $imagenPod, $Descripcion){
    $db = connect();
    if($db!=NULL){
      $query ='INSERT INTO podcasts (nombrePod,imagenPod,Descripcion) values (?,?,?)';
      if (!($statement = $db->prepare($query))) {
          die("Preparation failed: (" . $db->errno . ") " . $db->error);
      }
      // Binding statement params
      if (!$statement->bind_param("sss", $nombrePod, $imagenPod,$Descripcion)) {
          die("Parameter vinculation failed: (" . $statement->errno . ") " . $statement->error);
      }
       // Executing the statement
      if (!$statement->execute()) {
          die("Execution failed: (" . $statement->errno . ") " . $statement->error);
      }


      mysqli_free_result($results);
      disconnect($db);
      return true;
    }
  }








  /*var_dump(login('Huitz','123456'));
  var_dump(login('pedro', 'hola'));*/
  //var_dump(getPodcastsHtml());
  //var_dump(getLastPodcastHtml());

 ?>
