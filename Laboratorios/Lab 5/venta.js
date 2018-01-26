
document.getElementById("body").onload = function(){ sirve() };
document.getElementById("venderMB").onclick = function(){ agrMB()}
document.getElementById("venderMG").onclick =function() { agrMG()}
document.getElementById("venderV").onclick = function(){ agrV()}
document.getElementById("finalizar").onclick = function(){ fin()}

var total=0;
var MB=0;
var MG=0;
var V=0;
var pMB=600;
var pMG=200;
var pV=1000;


function sirve(){
	alert("funciona el JS");

}

function agrMB(){
	var cant = document.getElementById("cantidadMB").value;
	var precio = document.getElementById("precioMB").innerHTML;
	precio=precio*cant;
	total=total+precio;
	MB= MB+cant;
}

function agrMG(){
	var cant = document.getElementById("cantidadMG").value;
	var precio = document.getElementById("precioMG").innerHTML;
	precio=precio*cant;
	total=total+precio;
	MG= MG+cant;
}
function agrV(){
	var cant = document.getElementById("cantidadV").value;
	var precio = document.getElementById("precioV").innerHTML;
	precio=precio*cant;
	total=total+precio;
	V= V+cant;

	document.getElementById("respuestas").innerHTML = total;
}
function fin(){
	var iva= total*.15;
	var text= "Su compra consta de : "+MB+" Mistery Book(s), "+MG+" Mistery Games, "+V+" Vida(s), con un costo de : $"+total+ " con un iva de :$"+iva ;
	alert(text);
}





