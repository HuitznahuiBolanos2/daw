document.getElementById("body").onload = function(){ sirve() };
document.getElementById("ital").onmouseover= cambiar_italicas;
document.getElementById("neg").onmouseover = cambiar_negritas;
document.getElementById("sm").onmouseover = cambiar_smallmayus;
document.getElementById("normal").onmouseover = cambiar_normal;
document.getElementById("usuario").onfocus = subrrayar_usuario;
document.getElementById("password").onfocus = subrrayar_password;


function cambiar_italicas(){

	var x=document.getElementsByClassName("ejemplo");
	for(var i=0;i<x.length;i++){
		x[i].style.fontStyle = "italic";
	}

}

function cambiar_negritas(){
	var x=document.getElementsByClassName("ejemplo");
	for(var i=0;i<x.length;i++){
		x[i].style.fontWeight = "bold";
	}
}

function cambiar_smallmayus(){
	var x=document.getElementsByClassName("ejemplo");
	for(var i=0;i<x.length;i++){
		x[i].style.fontVariant = "small-caps";
	}
}

function cambiar_normal(){
	var x=document.getElementsByClassName("ejemplo");
	for(var i=0;i<x.length;i++){
		x[i].style.fontVariant = "normal";
		x[i].style.fontWeight = "normal";
		x[i].style.fontStyle = "normal";

	}
}

function subrrayar_usuario(){
	document.getElementById("usuario").style.background = "yellow";
	document.getElementById("usuario").value = "Aqui escribe tu usuario";
}
function subrrayar_password(){
	document.getElementById("password").style.background = "yellow";
}


function sirve(){
	alert("funciona el JS");
	var t=0;
	setInterval(function(){t=contador(t)},1000 );

}
function contador(t){
	t++
	document.getElementById("tiempo").innerHTML = "Tiempo en pagina: "+t;
	return t;

}
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}
