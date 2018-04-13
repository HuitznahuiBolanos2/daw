<?php
    $name = "huitz";
    $url = "http://localhost/daw/Laboratorios/Web%20Service/primerService/public/$name"; //Route to the REST web service
    $c = curl_init($url);
    $response = curl_exec($c);
    curl_close($c);
    //var_dump($response);
?>
