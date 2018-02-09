<?php
include '_title.html';
echo "<title>Laboratorio 9</title>";
include '_header.html';
?>
<?php
echo "<h1> Hola Mundo!!</h1>";
    
    function promedio(array $calif){
        $length = sizeof($calif);
        $prom = array_sum($calif)/$length;
         
        return $prom;
    }
    $cal = array (4,6,5);
    echo promedio($cal);
?>
<?php
    function mediana(array $datos){
        sort($datos);
        $length = sizeof($datos);
        $mitad = $length/2;
        $mediana = $datos[$mitad];
        return $mediana;
    }
$dat = array (3,5,4,9,6);
echo "<h3>La mediana del Array es: </h3>" ;
echo mediana($dat);
?>
<?php

function lista(array $arr){
    $length = sizeof($arr);
    for($x = 0; $x < $length; $x++) {
        echo $arr[$x];
        echo "<br>";
    }
    $prom = promedio($arr);
    $med = mediana($arr);
    sort($arr);
    echo "<h3>Lista de un arreglo:</h3><ul><li>Promedio: ";
    echo $prom;
    echo "</li><li>Mediana: ";
    echo $med;
    echo "</li><br>Lista ascendente:<br>";
    for($x = 0; $x < $length; $x++) {
            echo "<li>";
            echo $arr[$x];
            echo "</li>";
    }
    rsort($arr);
    echo "<br> Lista descendente: <br>";
    for($x = 0; $x < $length; $x++) {
            echo "<li>";
            echo $arr[$x];
            echo "</li>";
    }
    
}
$array = array (5,6,8,15,2,23);
echo "<br><br>";
echo "El array de la lista es:<br> ";
echo lista($array);
?>
<?php
function tablaCuas($num){
    echo "<table border=\"2px\" >";
    for($res=1;$res<=$num;$res++){
        echo "<tr><td>";
        echo $res;
        echo "</td><td>";
        $cua=$res*$res;
        echo $cua;
        echo "</td></tr>";
    }
    echo "</table>";
}
$num =5;
echo "<h3> La tabla de los cuadrados hasta " . $num . " es: </h3><br>";
echo tablaCuas($num);
?>



<?php
include '_footer.html';
?>