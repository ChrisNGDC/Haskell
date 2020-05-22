module Library where
import PdePreludat

-- Ejercicios Basicos --

-- 1 --

esMultiploDeTres :: Number -> Bool
esMultiploDeTres num = rem num 3 == 0

-- 2 --

esMultiploDe :: Number -> Number -> Bool
esMultiploDe num1 num2 =  0 == rem num1 num2

-- 3 --

cubo :: Number -> Number
cubo = (^3)

-- 4 --

area :: Number -> Number -> Number
area base = (*base)

-- 5 --

esBisiesto :: Number -> Bool
esBisiesto num = esMultiploDe num 400 || esMultiploDe num 4 && not (esMultiploDe num 400)

-- 6 --

celsiusAFarenheit :: Number -> Number
celsiusAFarenheit temperatura = (temperatura * 1.8) + 32

-- 7 --

farenheitACelsius :: Number -> Number
farenheitACelsius temperatura = (temperatura - 32) / 1.8

-- 8 --

haceFrioCelsius :: Number -> Bool
haceFrioCelsius = (<=8)

haceFrioFarenheit :: Number -> Bool
haceFrioFarenheit = haceFrioCelsius.farenheitACelsius

-- 9 --

restoMaxMin :: Number -> Number -> Number
restoMaxMin num1 num2 = rem (max num1 num2) (min num1 num2)

mcd :: Number -> Number -> Number
mcd num1 num2 
            | restoMaxMin num1 num2 /= 0 = mcd (min num1 num2) (restoMaxMin num1 num2)
            | otherwise = min num1 num2

mcm :: Number -> Number -> Number
mcm num1 num2 = (num1 / mcd num1 num2) * num2

-- 10 a --

maximoEntre3 :: Number -> Number -> Number -> Number
maximoEntre3 num1 num2 = ((max num1).(max num2))

minimoEntre3 :: Number -> Number -> Number -> Number
minimoEntre3 num1 num2 = ((min num1).(min num2))

dispersion :: Number -> Number -> Number -> Number
dispersion num1 num2 num3 = maximoEntre3 num1 num2 num3 - minimoEntre3 num1 num2 num3

-- 10 b --

diasParejos :: Number -> Number -> Number -> Bool
diasParejos num1 num2 num3 = (dispersion num1 num2 num3) < 30

diasNormales :: Number -> Number -> Number -> Bool
diasNormales num1 num2 num3 = not (diasLocos  num1 num2 num3 || diasParejos  num1 num2 num3)

diasLocos :: Number -> Number -> Number -> Bool
diasLocos num1 num2 num3 = (dispersion num1 num2 num3) > 100

-- 11 --

alturaPinoCambioDePeso :: Number
alturaPinoCambioDePeso = 3

pesoPinoPorCentimetroHastaCambio :: Number
pesoPinoPorCentimetroHastaCambio = 3

pesoPinoPorCentimetroDesdeCambio :: Number
pesoPinoPorCentimetroDesdeCambio = 2

pesoUtilLimiteInferior :: Number
pesoUtilLimiteInferior = 400

pesoUtilLimiteSuperior :: Number
pesoUtilLimiteSuperior = 1000

metrosACentimetros :: Number -> Number
metrosACentimetros = (*100)

pesoHastaCambio :: Number -> Number
pesoHastaCambio altura = metrosACentimetros (min alturaPinoCambioDePeso altura) * pesoPinoPorCentimetroHastaCambio

pesoDesdeCambio :: Number -> Number
pesoDesdeCambio altura = metrosACentimetros (max alturaPinoCambioDePeso altura - alturaPinoCambioDePeso) * pesoPinoPorCentimetroDesdeCambio

pesoPino :: Number -> Number
pesoPino altura = pesoHastaCambio altura + pesoDesdeCambio altura

esPesoUtil :: Number -> Bool
esPesoUtil peso = (peso >= pesoUtilLimiteInferior) && (peso <= pesoUtilLimiteSuperior)

sirvePino :: Number -> Bool
sirvePino = esPesoUtil.pesoPino

-- 12 --

buscarCuadrado :: Number -> Number -> Bool
buscarCuadrado num contador
                | num == contador ^ 2 = True
                | num > contador ^ 2 = buscarCuadrado num  (siguiente contador)
                | num <  contador ^ 2 = False

esCuadradoPerfecto :: Number -> Bool
esCuadradoPerfecto num = buscarCuadrado num 1

-- Ejercicios Aplicacion Parcial --

-- 1 --

siguiente :: Number -> Number
siguiente = (+1)

-- 2 --

mitad :: Number -> Number
mitad = (/2)

-- 3 --

inversa :: Number -> Number
inversa = (1/)

-- 4 --

triple :: Number -> Number
triple = (*3)

-- 5 --

esNumeroPositivo :: Number -> Bool
esNumeroPositivo = (>0)

-- Ejercicios Composicion --

-- 1 --

esMultiploDeV2 :: Number -> Number -> Bool
esMultiploDeV2 num =  (==0).rem num

-- 2 --

esBisiestoV2 :: Number -> Bool
esBisiestoV2 num = ((esMultiploDe num 400 ||).(esMultiploDe num 4 &&).not.(esMultiploDe num)) 400

-- 3 --

inversaRaizCuadrada :: Number -> Number
inversaRaizCuadrada = inversa.sqrt

-- 4 --

incrementMCuadradoN :: Number -> Number -> Number
incrementMCuadradoN num = (+ num ^ 2)

-- 5 --

esResultadoPar :: Number -> Number -> Bool
esResultadoPar num = even.(num^)

-- Ejercicios Tuplas --

-- 1 --

fst3 :: [a] -> a
fst3 = head

snd3 :: [a] -> a
snd3 = head.tail

trd3 :: [a] -> a
trd3 = last

-- 2 --

aplicar :: ((a -> b),(a -> c)) -> a -> (b,c)
aplicar (funcion1, funcion2) elem = (funcion1 elem, funcion2 elem)

-- 3 --

cuentaBizarra :: (Number, Number) -> Number
cuentaBizarra (elem1, elem2)
                        | elem1 > elem2 = elem1 + elem2
                        | elem1 + 10 < elem2 = elem2 - elem1
                        | otherwise = elem1 * elem2

-- 4 a --

esNotaBochazo :: Number -> Bool
esNotaBochazo = (<5)

-- 4 b --

aprobo :: (Number, Number) -> Bool
aprobo notas = (not.(esNotaBochazo (fst notas) &&).(esNotaBochazo)) (snd notas)

-- 4 c --

promociono :: (Number, Number) -> Bool
promociono notas = aprobo notas && (fst notas + snd notas > 14)

-- 4 d --

consultaPrimerParcial ::  (Number, Number) -> Bool
consultaPrimerParcial notas = fst notas > 5

-- 5 a --

nota1 :: ((Number, Number),(Number, Number)) -> Number
nota1 notasYRec = fst (fst notasYRec)

nota2 :: ((Number, Number),(Number, Number)) -> Number
nota2 notasYRec = snd (fst notasYRec)

rec1 :: ((Number, Number),(Number, Number)) -> Number
rec1 notasYRec = fst (snd notasYRec)

rec2 :: ((Number, Number),(Number, Number)) -> Number
rec2 notasYRec = snd (snd notasYRec)

notasFinales :: ((Number, Number),(Number, Number)) -> (Number, Number)
notasFinales notasYRec = (max (nota1 notasYRec) (rec1 notasYRec), max (nota2 notasYRec) (rec2 notasYRec))

-- 5 b --

consultaRecursar :: ((Number, Number),(Number, Number)) -> Bool
consultaRecursar = not.aprobo.notasFinales

-- 5 c --

consultaPrimerRec :: ((Number, Number),(Number, Number)) -> Bool
consultaPrimerRec notasYRec = rec1 notasYRec > nota1 notasYRec

-- 5 d --

recuperoDeGusto :: ((Number, Number),(Number, Number)) -> Bool
recuperoDeGusto notasYRec = ((nota1 notasYRec > 5) && (nota2 notasYRec > 5)) && ((rec1 notasYRec /= -1) || (rec2 notasYRec /= -1))

-- 6 --

esMayorDeEdad :: (Number, Number) -> Bool
esMayorDeEdad = (>21).snd

-- 7 --

calcular :: (Number, Number) -> (Number, Number)
calcular dupla
            | esMultiploDeV2 (fst dupla) 2 && esMultiploDeV2 (snd dupla) 2 = (2 * fst dupla, snd dupla)
            | not (esMultiploDeV2 (fst dupla) 2) && esMultiploDeV2 (snd dupla) 2 = (fst dupla, snd dupla)
            | not (esMultiploDeV2 (fst dupla) 2) && not (esMultiploDeV2 (snd dupla) 2) = (fst dupla, 1 + snd dupla)
            | otherwise = (2 * fst dupla, 1 + snd dupla)

-- Ejercicios Listas --

-- 1 --

sumaLista :: [Number] -> Number
sumaLista = sum

-- 2 a --

frecuenciaCardiaca :: [Number]
frecuenciaCardiaca = [80, 100, 120, 128, 130, 123, 125]

promedioFrecuenciaCardiaca :: Number
promedioFrecuenciaCardiaca = sumaLista frecuenciaCardiaca / length frecuenciaCardiaca

-- 2 b --

frecuenciaCardiacaMinuto :: Number -> Number
frecuenciaCardiacaMinuto num = last (take ((num / 10) + 1) frecuenciaCardiaca)

-- 2 c --

frecuenciasHastaMomento :: Number -> [Number]
frecuenciasHastaMomento num = take ((num / 10) + 1) frecuenciaCardiaca

-- 3 --

esCapicua :: Ord a => [[a]] -> Bool
esCapicua listaCompuesta = concat listaCompuesta == reverse (concat listaCompuesta)

-- 4 a --

duracionLlamadas :: ((String,[Number]),(String,[Number]))
duracionLlamadas = (("Horario Reducido",[20,10,25,15]),("Horario Normal",[10,5,8,2,9,10]))

cuandoHabloMasMinutos :: String
cuandoHabloMasMinutos
                    | (sumaLista.snd.fst) duracionLlamadas > (sumaLista.snd.snd) duracionLlamadas = (fst.fst) duracionLlamadas
                    | otherwise = (fst.snd) duracionLlamadas

-- 4 b --

cuandoHizoMasLlamadas :: String
cuandoHizoMasLlamadas
                    | (length.snd.fst) duracionLlamadas > (length.snd.snd) duracionLlamadas = (fst.fst) duracionLlamadas
                    | otherwise = (fst.snd) duracionLlamadas

-- Ejercicios Orden Superior --

-- 1 --

existsAny :: (a -> Bool) -> [a] -> Bool
existsAny funcion lista = funcion (fst3 lista) || funcion (snd3 lista) || funcion (trd3 lista)

-- 2 --

mejor :: ((Number -> Number), (Number -> Number)) -> Number -> Number
mejor (funcion1, funcion2) num = max (funcion1 num) (funcion2 num)

-- 3 --

aplicarPar :: (b -> a) -> (b, b) -> (a, a)
aplicarPar funcion dupla = (funcion (fst dupla), funcion (snd dupla))

-- 4 --

parDeFns :: [(a -> b)] -> a -> [b]
parDeFns [funcion1, funcion2] num = [funcion1 num, funcion2 num]

-- Ejercicios Listas + Orden Superior --

-- 1 --

esMultiploDeAlguno :: Number -> [Number] -> Bool
esMultiploDeAlguno num = existsAny (esMultiploDe num)

-- 2 --

promedio :: [Number] -> Number
promedio lista = (sum lista) / (length lista)

promedios :: [[Number]] -> [Number]
promedios = map promedio

-- 3 --

promediosSinAplazos :: [[Number]] -> [Number]
promediosSinAplazos = map (promedio.(filter (>4)))

-- 4 --

mejoresNotas :: [[Number]] -> [Number]
mejoresNotas = map maximum

-- 5 --

aprobó :: [Number] -> Bool
aprobó = (>6).minimum

-- 6 --

aprobaron :: [[Number]] -> [[Number]]
aprobaron = ((filter (not.null)).(map (filter (>6))))

-- 7 --

divisoresLista :: Number -> Number -> [Number] -> [Number]
divisoresLista num contador lista
                        | contador < 1 = lista
                        | mcd num contador == contador = divisoresLista num (contador - 1) ([contador]++lista)
                        | mcd num contador /= contador = divisoresLista num (contador - 1) lista

divisores :: Number -> [Number]
divisores num = divisoresLista num num []

-- 8 --

exists :: (a -> Bool) -> [a] -> Bool
exists funcion lista = (length (filter (==True) (map funcion lista))) > 0

-- 9 --

hayAlgunNegativo :: [Number] -> Bool
hayAlgunNegativo = exists (not.esNumeroPositivo)

-- 10 --

aplicarFunciones :: [(a -> b)] -> a -> [b]
aplicarFunciones listaFunciones num =  map ($ (num)) listaFunciones

-- 11 --

sumaF :: [(Number -> Number)] -> Number -> Number
sumaF listaFunciones num = sum (map ($ (num)) listaFunciones)

-- 12 --

subirHabilidad :: Number -> [Number] -> [Number]
subirHabilidad num habilidades
                        | null habilidades = habilidades
                        | head habilidades + num > 12 = [12]++(subirHabilidad num (tail habilidades))
                        | otherwise = [head habilidades + num]++(subirHabilidad num (tail habilidades))

-- 13a --

flimitada  :: (Number -> Number) -> Number -> Number
flimitada funcion num
                | funcion num > 12 = 12
                | funcion num < 0 = 0
                | otherwise = funcion num

-- 13b --

cambiarHabilidad :: (Number -> Number) -> [Number] -> [Number]
cambiarHabilidad funcion habilidades = map (flimitada funcion) habilidades

-- 14a --

esPar :: Number -> Bool
esPar num = rem num 2 == 0

primerosPares :: [Number] -> [Number]
primerosPares = takeWhile esPar

-- 14b --

esDivisor :: Number -> Number -> Bool
esDivisor num1 num2 = mcd num1 num2 == min num1 num2

primerosDivisores :: [Number] -> Number -> [Number]
primerosDivisores lista num = takeWhile (esDivisor num) lista

-- 14c --

primerosNoDivisores :: [Number] -> Number -> [Number]
primerosNoDivisores lista num = takeWhile (not.esDivisor num) lista

-- 15 --

huboMesMejorDe :: [Number] -> [Number] -> Number -> Bool
huboMesMejorDe ingresos egresos num = any (> num) (zipWith (-) ingresos egresos)

-- 16a --

crecimientoAnual :: Number -> Number
crecimientoAnual edad
                | edad <= 10 = 24 - (edad * 2)
                | edad <= 15 = 4
                | edad <= 17 = 2
                | edad <= 29 = 1
                | otherwise = 0

-- 16b --

crecimientoEntreEdades :: Number -> Number -> Number
crecimientoEntreEdades edad1 edad2
                        | edad1 == edad2 = 0
                        | otherwise = crecimientoAnual (min edad1 edad2) + crecimientoEntreEdades (max edad1 edad2) (min edad1 edad2 + 1)

-- 16c --

aumentar1 :: Number -> Number
aumentar1 num = (crecimientoEntreEdades num (num + 1))

alturasEnUnAnio :: Number -> [Number] -> [Number]
alturasEnUnAnio edad listaAlturas = map  (+ (aumentar1 edad)) listaAlturas

-- 16d --

alturaEnEdades :: Number -> Number -> [Number] -> [Number]
alturaEnEdades altura edad listaEdades = map (+altura) (map (crecimientoEntreEdades edad) listaEdades)

-- 17a --



-- 17b --



-- 18 --



-- 19 --



-- 20 --



-- **Extras mio** -- 

-- Primos --

buscarPrimo :: Number -> Number -> Bool
buscarPrimo num contador
        | mcd num contador /= 1 = False
        | mcd num contador == 1 && contador == 1 = True
        | otherwise = buscarPrimo num (contador - 1)

esPrimo :: Number -> Bool
esPrimo num = buscarPrimo num (div num 2)

primosHasta :: Number -> [Number]
primosHasta num 
        | num <= 0 = []
        | otherwise = reverse ((filter esPrimo [num,num-1..2])++[1])

-- Fibonacci (recursivo y por formula) --

fibonacci :: Number -> Number
fibonacci num = round ((1/sqrt(5))*(((1+sqrt(5))/2)^num)-(1/sqrt(5))*(((1-sqrt(5))/2)^num))

fibonacciR :: Number -> Number
fibonacciR 0 = 0
fibonacciR 1 = 1
fibonacciR num = fibonacciR (num - 2) + fibonacciR (num - 1)

-- Base X a Decimal --

baseEnteroADecimal :: [Number] -> Number -> Number -> Number
baseEnteroADecimal [] _ _ = error "Numero vacio"
baseEnteroADecimal [unElemento] num base = unElemento * base ^ num
baseEnteroADecimal lista num base = last lista * base ^ num + baseEnteroADecimal (init lista) (num+1) base

baseDecimalADecimal :: [Number] -> Number -> Number -> Number
baseDecimalADecimal [] _ _ = error "Numero vacio"
baseDecimalADecimal [unElemento] num base = unElemento * (1 / (base ^ num))
baseDecimalADecimal lista num base = head lista * (1 / (base ^ num)) + baseDecimalADecimal (tail lista) (num+1) base

baseADecimal :: [Number] -> [Number] -> Number -> String
baseADecimal entero decimal base = show ((baseEnteroADecimal entero 0 base) + (baseDecimalADecimal decimal 1 base))

-- Decimal a Base X --

decimalEnteroABase :: Number -> Number-> [Number]
decimalEnteroABase 0 _ = []
decimalEnteroABase 1 _ = [1]
decimalEnteroABase numero base = ((rem numero base) : decimalEnteroABase (div numero base) base)

decimalDecimalABase :: Number -> Number -> Number -> [Number]
decimalDecimalABase _ 8 _ = [0]
decimalDecimalABase 0 _ _ = []
decimalDecimalABase numero 0 base = [666] ++ decimalDecimalABase numero 1 base
decimalDecimalABase numero contador base
        | numero * base >= 100000000 = [div (numero * base) 100000000] ++ decimalDecimalABase ((numero * base) - ((div (numero * base) 100000000) * 100000000)) (contador + 1) base
        | otherwise = [div (numero * base) 100000000] ++ decimalDecimalABase (numero * base) (contador + 1) base

pasarAPalabra :: [Number] -> String
pasarAPalabra [] = ""
pasarAPalabra (0:resto) = "0" ++ pasarAPalabra resto
pasarAPalabra (1:resto) = "1" ++ pasarAPalabra resto
pasarAPalabra (2:resto) = "2" ++ pasarAPalabra resto
pasarAPalabra (3:resto) = "3" ++ pasarAPalabra resto
pasarAPalabra (4:resto) = "4" ++ pasarAPalabra resto
pasarAPalabra (5:resto) = "5" ++ pasarAPalabra resto
pasarAPalabra (6:resto) = "6" ++ pasarAPalabra resto
pasarAPalabra (7:resto) = "7" ++ pasarAPalabra resto
pasarAPalabra (8:resto) = "8" ++ pasarAPalabra resto
pasarAPalabra (9:resto) = "9" ++ pasarAPalabra resto
pasarAPalabra (10:resto) = "A" ++ pasarAPalabra resto
pasarAPalabra (11:resto) = "B" ++ pasarAPalabra resto
pasarAPalabra (12:resto) = "C" ++ pasarAPalabra resto
pasarAPalabra (13:resto) = "D" ++ pasarAPalabra resto
pasarAPalabra (14:resto) = "E" ++ pasarAPalabra resto
pasarAPalabra (15:resto) = "F" ++ pasarAPalabra resto
pasarAPalabra numeros = "," ++ pasarAPalabra (tail numeros)

decimalA8Bits :: Number -> Number -> Number
decimalA8Bits numero ceros
        | numero < 10 = numero * 10 ^ (7 - ceros)
        | numero < 100 = numero * 10 ^ (6 - ceros)
        | numero < 1000 = numero * 10 ^ (5 - ceros)
        | numero < 10000 = numero * 10 ^ (4 - ceros)
        | numero < 100000 = numero * 10 ^ (3 - ceros)
        | numero < 1000000 = numero * 10 ^ (2 - ceros)
        | numero < 10000000 = numero * 10 ^ (1 - ceros)
        | otherwise = numero / 10 ^ ceros

decimalABase :: Number -> Number -> Number -> Number -> String
decimalABase entero decimal ceros base = pasarAPalabra (reverse (decimalEnteroABase entero base) ++ decimalDecimalABase (decimalA8Bits decimal ceros) 0 base)