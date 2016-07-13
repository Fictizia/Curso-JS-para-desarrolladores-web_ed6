# Máquina expendedora

Script para gestionar por consola una máquina expendedora

**Características:**

*Solo los usuarios registrados pueden usar la máquina
*El sistema funciona sin dinero real, en su lugar se usa un sistema de puntos
*Los usuarios disponen de unos puntos para gastar en la máquina que el departamento de personal asigna.
*La maquina no concederá creditos, solo trabaja en base a los puntos disponibles.
*Para agilizar la reposición de lo consumido... la máquina debe controlar en stock

```javascript
var users = [];
var products = [];

var vendingMachine = {
		users : [
			{ id: 0, username: "jgarcia", password: "zzz", role: "admin", wallet: 100 },
			{ id: 1, username: "mrRobot", password: "aaa", role:"client", wallet: 100 },
			{ id: 2, username: "fSociety", password: "bbb", role: "client", wallet: 100 },
			{ id: 3, username: "neo", password: "ccc", role: "client", wallet: 100 }
		]
}
	

function login(user,pass){

	var correctUser = false,
		correctPass = false;

	for (var i = 0; i < users.length; i++){
		if( users[i].username === user ){
			correctUser = true;
		}
		if( users[i].password === pass ){
			correctPass = true;
		}		
	}

	if(correctUser && correctPass){
		console.log("Usuario ok");
	}else{
		console.log("Datos incorrectos");
	}

}

login('jgarcia','demo');
```