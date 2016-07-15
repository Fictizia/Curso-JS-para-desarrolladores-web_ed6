# Máquina expendedora

Script para gestionar por consola una máquina expendedora

**Características:**

* Solo los usuarios registrados pueden usar la máquina
* El sistema funciona sin dinero real, en su lugar se usa un sistema de puntos.
* Los usuarios disponen de unos puntos para gastar en la máquina que el departamento de personal asigna.
* La maquina no concederá creditos, solo trabaja en base a los puntos disponibles.
* Para agilizar la reposición de lo consumido... la máquina debe controlar el stock.

```javascript

var users = [];
var products = [];

var vendingMachine = {
    users : [
        { id: 0, username: 'jgarcia', password: 'zzz', role: 'admin', wallet: 100 },
        { id: 1, username: 'mrRobot', password: 'aaa', role:'client', wallet: 100 },
        { id: 2, username: 'fSociety', password: 'bbb', role: 'client', wallet: 100 },
        { id: 3, username: 'neo', password: 'ccc', role: 'client', wallet: 100 }
    ],
    products : [
        { id: 1, name: 'Pepsi', stock: 20, max_units: 30, price: 10},
        { id: 2, name: 'Water', stock: 10, max_units: 15, price: 8},
        { id: 3, name: 'Doritos', stock: 15, max_units: 10, price: 5}
    ],
    actions: {
        login: function(user, pass){
            var userData = '',
                status = 0;

            for (var i = 0; i < vendingMachine.users.length; i++){
 
                /*
                console.log('vuelta: '+i);
                console.log('comparando usuario introducido ('+user+') con objeto de usuarios: '+vendingMachine.users[i].username);
                console.log('comparando clave introducida ('+pass+') con objeto de usuarios: '+vendingMachine.users[i].password);
                */

                if(user === vendingMachine.users[i].username && pass === vendingMachine.users[i].password){
                    userData = vendingMachine.users[i];
                    status = 1;
                    userData.status=status;
                    break;
                }
                       
            }
            return userData;
        },
        addUser: function (username, password, role, wallet){
            var newUser = {},
                id = vendingMachine.users.length;

            vendingMachine.users.push({ id: id, username: username, password: password, role: role, wallet: wallet});
            console.log('Usuario '+username+' añadido ;)');
        },
        userBalance: function(user, pass){
            var verifyUser = vendingMachine.actions.login(user, pass),
            	wallet = 0,
            	msg = '';

            if ( typeof verifyUser !== 'undefined'){
                console.log('Cuenta verificada con éxito.');  
                var userData = vendingMachine.actions.login(user, pass),
                    wallet = userData.wallet;

                switch(wallet) {
                    case 0:
                        msg = 'Habla con el administrador para que te recargue más puntos.';
                        break;
                    case (wallet <= 10):
                        msg = 'Deberías de ir pensando en recargar tus puntos antes de que sea tarde.';
                        break;
                    case (wallet >= 10):                            
                        msg = 'Tienes puntos suficientes para seguir comprando en la máquina.';
                }

                console.log('Tu saldo es de '+wallet+' puntos.' + msg);
            }else{
                console.log('Datos incorrectos, debes introducir tu clave para ver tu saldo.');
            }

            return wallet;
        }
    }

};

//shorteners 
var action = vendingMachine.actions,
    usersList = vendingMachine.users,
	userInfo = vendingMachine.actions.login,
	role =  userInfo.role,
	username = userInfo.username,
	wallet = userInfo.wallet;

action.login('jgarcia','1234');//login ko
action.login('neo','ccc');//login ok

action.addUser('parker','1234','client',100);//user added
usersList;//updated users list

action.userBalance('neo','ccc');

```
