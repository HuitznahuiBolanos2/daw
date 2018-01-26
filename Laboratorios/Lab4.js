function fun1(){
	var cua=0;
	var numero=prompt("Ingrese un numero porfavor");
	var text='<table><tr>';
	if(!isNaN(numero)){
		for(var i=1;i<=numero;i++){
			cua=i*i;
			text += '<td>'+i+'</td>'+'<td>'+cua+'</td></tr>';
		}
		text+='</table>';

		document.write(text);
	 } else{
	 //	document.getElementById('respuestasjs').write("Error de ingreos de datos");
	 alert("Error, no se introdujo un numero valido.");
	 }
	 
}
function fun2(){
	var t=0;
	
	var x=Math.trunc(Math.random()*100);
	var y=Math.trunc(Math.random()*100);
	var res=x+y; 
	var d= new Date();//setInterval(function(){ t=timer(t) }, 1000 );
	var numero = prompt("Ingrese el resultado de "+x+" + "+y);
	var d2 = new Date();
	t=Math.trunc((d2-d)/1000);
	if(res==numero){
		document.getElementById("respuestasjs").innerHTML = "Correcto "+t+"s";
	}else{
		document.getElementById("respuestasjs").innerHTML = "Incorrecto "+t+"s";	
	}


}
function contador(){
	var l=arguments.length;
	var cero=0;
	var neg=0;
	var pos=0;
	for( var i=0;i<l;i++){
		if(arguments[i]<0){
			neg++;
			document.getElementById("respuestasjs").innerHTML = "Incorrecto ";
		}else if(arguments[i]>0){
			pos++;
		}else{
			cero++;
		}
	}
	document.getElementById("respuestasjs").innerHTML = "Ceros: "+cero+"     Positivos: "+pos+"     Negativos: "+neg;


}
function promedio(){
	var res=[];
	var prom=0;
	var div=0;
	for(var i=0;i<arguments.length;i++){
		for(var j=0;j<arguments[i].length;j++){
			prom=prom+arguments[i][j];
			div=div+1;
		}	
		res[i]=prom/div;
		prom=0;
		div=0;
	}
	document.getElementById("respuestasjs").innerHTML = res;
}
function inverso(n){
	var num=n;
	var y=0;
	var f=0;
	var res=0;
	var z=0;
	//document.getElementById("respuestasjs").innerHTML=13;
	while (num>10){
		num=num/10;
		y++;
	}
	res=Math.trunc(num);
	f=res*10;
	num=num*10;
	
	for(var i=1;i<=y;i++){
		res=res+((Math.trunc(num-f))*Math.pow(10,i));
		res=Math.trunc(res);
		
		//f=(num-f)*10;
		num=(num-f)*10+.1;
		f=Math.trunc(num/10)*10;
	}
	document.getElementById("respuestasjs").innerHTML+=res;
}
function mayor(){
	document.getElementById("respuestasjs").innerHTML= pepe.mayoredad;
}
function resum(){
	document.getElementById("respuestasjs").innerHTML=pepe.resumen;
}

var pepe={
	nombre:"pepe", 
	edad:22, 
	hobby: "Leer",
	mayoredad: function(){
		if(this.edad>18){
			return "si";
		}else{
			return "no";
		}
	},
	resumen: function(){
	return this.nombre+" tiene "+this.edad+" años y le gusta "+this.hobby;
	}
};


