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

alturaPinoCambioDePeso = 3
pesoPinoPorCentimetroHastaCambio = 3
pesoPinoPorCentimetroDesdeCambio = 2
pesoUtilLimiteInferior = 400
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

-- 6 --

esMultiploDeV2 :: Number -> Number -> Bool
esMultiploDeV2 num =  (==0).rem num

-- 7 --

esBisiestoV2 :: Number -> Bool
esBisiestoV2 num = ((esMultiploDe num 400 ||).(esMultiploDe num 4 &&).not.(esMultiploDe num)) 400

-- 8 --

inversaRaizCuadrada :: Number -> Number
inversaRaizCuadrada = inversa.sqrt

-- 9 --

incrementMCuadradoN :: Number -> Number -> Number
incrementMCuadradoN num = (+ num ^ 2)

-- 10 --

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