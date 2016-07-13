/*Práctica 1 - Diseña un script para gestionar por consola una máquina expendedora

Características:

Solo los usuarios registrados pueden usar la máquina
El sistema funciona sin dinero real, en su lugar se usa un sistema de puntos
Los usuarios disponen de unos puntos para gastar en la máquina que el departamento de personal asigna.
La maquina no concederá creditos, solo trabaja en base a los puntos disponibles.
Para agilizar la reposición de lo consumido... la maquina debe controlar en stock
Paso 1 - Creamos los primeros objetos básicos:

Maquina Expendedora (Objeto)
Productos (Array)
Clientes (Array)*/
var MaquinaExpendedora = {};
var Productos = [];
var Clientes = [];