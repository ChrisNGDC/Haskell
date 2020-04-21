# Guia de ejercicios de Haskell 2020

**Funcional 1: Ejercicios Basicos**

- 1 - Definir la función esMultiploDeTres, que devuelve True si un número es múltiplo de 3.

- 2 - Definir la función esMultiploDe, que devuelve True si el segundo es múltiplo del primero.

- 3 - Definir la función cubo, devuelve el cubo de un número.

- 4 - Definir la función area, devuelve el área de un rectángulo a partir de su base y su altura.

- 5 - Definir la función esBisiesto, indica si un año es bisiesto. (Un año es bisiesto si es divisible por 400 o es divisible por 4 pero no es divisible por 100) Nota: Resolverlo reutilizando la función esMultiploDe.

- 6 - Definir la función celsiusToFahr, pasa una temperatura en grados Celsius a grados Fahrenheit.

- 7 - Definir la función fahrToCelsius, la inversa de la anterior.

- 8 - Definir la función haceFrioF, indica si una temperatura expresada en grados Fahrenheit es fría. Decimos que hace frío si la temperatura es menor a 8 grados Celsius. 

- 9 - Definir la función mcm/2 que devuelva el mínimo común múltiplo entre dos números, de acuerdo a esta fórmula.

- 10a - Definir dispersion, que toma los tres valores y devuelve la diferencia entre el más alto y el más bajo. Ayuda: extender max y min a tres argumentos, usando las versiones de dos elementos. De esa forma se puede definir dispersión sin escribir ninguna guarda (las guardas están en max y min, que estamos usando). 

- 10b - Definir diasParejos, diasLocos y diasNormales reciben los valores de los tres días. Se dice que son días parejos si la dispersión es chica, que son días locos si la dispersión es grande, y que son días normales si no son ni parejos ni locos. Una dispersión se considera chica si es de menos de 30 cm, y grande si es de más de un metro. 
Nota: Definir diasNormales a partir de las otras dos, no volver a hacer las cuentas. 

- 11 - En una plantación de pinos, de cada árbol se conoce la altura expresada en cm. El peso de un pino se puede calcular a partir de la altura así: 3 kg x cm hasta 3 metros, 2 kg x cm arriba de los 3 metros. P.ej. 2 metros ⇒  600 kg, 5 metros ⇒  1300 kg. 
Los pinos se usan para llevarlos a una fábrica de muebles, a la que le sirven árboles de entre 400 y 1000 kilos, un pino fuera de este rango no le sirve a la fábrica. Para esta situación: 
  - a - Definir la función pesoPino, recibe la altura de un pino y devuelve su peso. 
  - b - Definir la función esPesoUtil, recibe un peso en kg y devuelve True si un pino de ese peso le sirve a la fábrica, y False en caso contrario. 
  - c - Definir la función sirvePino, recibe la altura de un pino y devuelve True si un pino de ese peso le sirve a la fábrica, y False en caso contrario. Usar composición en la definición. 

- 12 - Implementar la función esCuadradoPerfecto, sin hacer operaciones con punto flotante. Ayuda: les va a venir bien una función auxiliar, tal vez de dos parámetros. Pensar que el primer cuadrado perfecto es 0, para llegar al 2do (1) sumo 1, para llegar al 3ro (4) sumo 3, para llegar al siguiente (9) sumo 5, después sumo 7, 9, 11 etc.. También algo de recursividad van a tener que usar. 

**Funcional 2: Aplicación Parcial**

- 1 - Definir una función siguiente, que al invocarla con un número cualquiera me devuelve el resultado de sumar a ese número 1.

- 2 - Definir la función mitad que al invocarla con un número cualquiera me devuelve la mitad de dicho número.

- 3 - Definir una función inversa, que invocando a la función con un número cualquiera me devuelva su inverso multiplicativo.

- 4 - Definir una función triple, que invocando a la función con un número cualquiera me devuelva el triple del mismo.

- 5 - Definir una función esNumeroPositivo, que invocando a la función con un número cualquiera me devuelva true si el número es positivo y false en caso contrario.

**Funcional 3: Composición**

- 1 - Resolver la función del ejercicio 2 de la guía anterior esMultiploDe, utilizando aplicación parcial y composición.

- 2 - Resolver la función del ejercicio 5 de la guía anterior esBisiesto, utilizando aplicación parcial y composición.

- 3 - Resolver la función inversaRaizCuadrada, que da un número n devolver la inversa su raíz cuadrada.

- 4 - Definir una función incrementMCuadradoN, que invocándola con 2 números m y n, incrementa un valor n al cuadrado de m.

- 5 - Definir una función esResultadoPar, que invocándola con número n y otro m, devuelve true si el resultado de elevar n a m es par.

**Funcional 4: Tuplas**

- 1 - Definir las funciones fst3, snd3, trd3, que dada una tupla de 3 elementos devuelva el elemento correspondiente.

- 2 - Definir la función aplicar, que recibe como argumento una tupla de 2 elementos con funciones y un entero, me devuelve como resultado una tupla con el resultado de aplicar el elemento a cada una de la funciones.

- 3 - Definir la función cuentaBizarra, que recibe un par y: si el primer elemento es mayor al segundo devuelve la suma, si el segundo le lleva más de 10 al primero devuelve la resta 2do – 1ro, y si el segundo es más grande que el 1ro pero no llega a llevarle 10, devuelve el producto.

- 4 - Representamos las notas que se sacó un alumno en dos parciales mediante un par (nota1,nota2), p.ej. un patito en el 1ro y un 7 en el 2do se representan mediante el par (2,7). 
A partir de esto: 
  - a - Definir la función esNotaBochazo, recibe un número y devuelve True si no llega a 6, False en caso contrario. No vale usar guardas. 
  - b - Definir la función aprobo, recibe un par e indica si una persona que se sacó esas notas aprueba. Usar esNotaBochazo. 
  - c - Definir la función promociono, que indica si promocionó, para eso tiene las dos notas tienen que sumar al menos 15 y además haberse sacado al menos 7 en cada parcial. 
  - d - Definir la funcion consultaPrimerParcial que dado un par indica si aprobó el primer parcial, usando esNotaBochazo y composición.

- 5 - Siguiendo con el dominio del ejercicio anterior, tenemos ahora dos parciales con dos recuperatorios, lo representamos mediante un par de pares ((parc1,parc2),(recup1,recup2)). 
Si una persona no rindió un recuperatorio, entonces ponemos un "-1" en el lugar correspondiente. 
Observamos que con la codificación elegida, siempre la mejor nota es el máximo entre nota del parcial y nota del recuperatorio. 
Considerar que vale recuperar para promocionar. En este ejercicio vale usar las funciones que se definieron para el anterior. 
  - a - Definir la función notasFinales que recibe un par de pares y devuelve el par que corresponde a las notas finales del alumno para el 1er y el 2do parcial.
  - b - Definir la función consultaRecursar que recibe un par de pares e indica si recursa o no. O sea, la respuesta debe ser True si recursa, y False si no recursa. Usar las funciones definidas en este punto y el anterior, y composición. 
  - c - Definir la función consultaPrimerRec que recibe un par de pares e indica si recuperó el primer parcial. Usar composición.
  - d - Definir la función recuperoDeGusto que dado el par de pares que representa a un alumno, devuelve True si el alumno, pudiendo promocionar con los parciales (o sea sin recup.), igual rindió al menos un recup. Vale definir funciones auxiliares. Hacer una definición que no use pattern matching, en las eventuales funciones auxiliares tampoco; o sea, manejarse siempre con fst y snd.

- 6 - Definir la función esMayorDeEdad, que dada una tupla de 2 elementos (persona, edad) me devuelva True si es mayor de 21 años y False en caso contrario.

- 7 - Definir la función calcular, que recibe una tupla de 2 elementos, si el primer elemento es par lo duplica, sino lo deja como está y con el segundo elemento en caso de ser impar le suma 1 y si no deja esté último como esta. 

**Funcional 5: Listas** 

- 1 - Definir una función que sume una lista de números.

- 2 - Durante un entrenamiento físico de una hora, cada 10 minutos de entrenamiento se tomóo la frecuencia cardíaca de uno de los participantes obteniéndose un total de 7 muestras, frecuenciaCardiaca = [80, 100, 120, 128, 130, 123, 125], con esto:
  - a - Definir la función promedioFrecuenciaCardiaca, que devuelve el promedio de la frecuencia cardíaca. 
  - b - Definir la función frecuenciaCardiacaMinuto, que recibe m que es el minuto en el cual quiero conocer la frecuencia cardíaca, m puede ser a los 10, 20, 30 ,40,..hasta 60. 
  - c - Definir la función frecuenciasHastaMomento, devuelve el total de frecuencias que se obtuvieron hasta el minuto m.

- 3 - Definir la función esCapicua, si data una lista de listas, me devuelve si la concatenación de las sublistas es una lista capicua.

- 4 - Se tiene información detallada de la duración en minutos de las llamadas que se llevaron a cabo en un período determinado, discriminadas en horario normal y horario reducido, duracionLlamadas = (("horarioReducido",[20,10,25,15]),(“horarioNormal”,[10,5,8,2,9,10])). 
  - a - Definir la función cuandoHabloMasMinutos, devuelve en que horario se habló más cantidad de minutos, en el de tarifa normal o en el reducido.  
  - b - Definir la función cuandoHizoMasLlamadas, devuelve en que franja horaria realizó más cantidad de llamadas, en el de tarifa normal o en el reducido.

**Funcional 6: Orden Superior**

