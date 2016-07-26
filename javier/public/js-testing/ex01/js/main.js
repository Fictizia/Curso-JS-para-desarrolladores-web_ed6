/*=======================================================================
Diseña un script que lea dos números y realice los siguientes cálculos:

Características:
 - Valor de su suma
 - Valor de su resta
 - Valor de su division
 - Valor de su producto

Pruebas necesarias:
 - Comprobar si ambos parámetros son números
 - Comprobar si uno o varios parámetros son cadenas
=======================================================================*/


    // Tests
    QUnit.module( "Módulo de calculosVarios(valor1, valor2)", function(){

        var condicion = {
            suma: 50,
            resta: -30,
            division: 0.25,
            multiplicacion: 400
        };

        var condicion2 = {
            suma: 30,
            resta: 50,
            division: -4,
            multiplicacion: -400
        };

        QUnit.test( "calculosVarios(10, 40) con números", function( assert ) {
            propEqual(condicion, calculosVarios(10, 40), "calculosVarios(10, 40) es igual a condicion");
            propEqual(condicion2, calculosVarios(40, -10), "calculosVarios(40, -10) es igual a condicion2");
        });

        QUnit.test( "calculosVarios(\"10\", \"40\") con cadenas", function( assert ) {
            propEqual(condicion, calculosVarios("10", "40"), "calculosVarios(\"10\", \"40\") es igual a condicion");
            propEqual(condicion2, calculosVarios("40", "-10"), "calculosVarios(\"40\", \"-10\") es igual a condicion2");
        });

    });

    // Código
    function calculosVarios(valor1, valor2){
        valor1 = parseFloat(valor1);
        valor2 = parseFloat(valor2);
        return {
            suma: valor1+valor2,
            resta: valor1-valor2,
            division: valor1/valor2 ,
            multiplicacion: valor1*valor2
        }
    }