
document.getElementById("Enter").onclick = function() { validarPS() };



function validarPS(){
	
	var pass = document.getElementById("Contraseña").value;
	if(pass != "contraseña"){
		document.getElementById("respuestas").innerHTML = "La contraseña es incorrecta, intente con 'contraseña'.";
	}else{
		document.getElementById("respuestas").innerHTML = "La contraseña es Correcta, Felicidades!!";
	}
}

