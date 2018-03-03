<?php
require_once "modelo.php";

function getPodcastsHtml(){
    $results = getPodcasts();
    $html = '';
    while ($fila = mysqli_fetch_array($results, MYSQLI_BOTH)) {
      $html .= '<div class="row">
                              <div class="col-md-3">
                              </div>
                              <div class="col-md-6">
                                <div class="card">
                                  <div class="card-image col-md-4">

                                      <img src="uploads/'.$fila["imagenPod"].'">
                                      <span class="card-title">'.$fila["nombrePod"].'</span>
                                  </div>
                                  <div class="card-content">
                                    <p>Descripcion: '.$fila["Descripcion"].'.</p>
                                    <p>Publicado el: '.$fila["created_at"].'.</p>
                                  </div>
                                </div>
                              </div>
                            </div>';

    }

    echo $html;
    mysqli_free_result($results);
    return true;
  }

  function getLastPodcastHtml(){
    $results=ultimaPodcastAgr();
    $html = '';
    while ($fila = mysqli_fetch_array($results, MYSQLI_BOTH)) {
      $html .= '<div class="row">
                              <div class="col-md-3">
                              </div>
                              <div class="col-md-6">
                                <div class="card">

                                  <div class="card-content">
                                      <div class=" col-md-2">
                                          <img src="uploads/'.$fila["imagenPod"].'">
                                      </div>
                                    <div class="col-md-4">
                                      <h4>'.$fila["nombrePod"].'</h4>
                                    </div>
                                    <div class ="col-md-6"
                                      <p>Descripcion: '.$fila["Descripcion"].'.</p>
                                      <p>Publicado el: '.$fila["created_at"].'.</p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                    </div>';

    }
    echo $html;
    mysqli_free_result($results);
    return true;
  }

 ?>
