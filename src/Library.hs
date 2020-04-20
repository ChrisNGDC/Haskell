module Library where
import PdePreludat

-- Ejercicios 1 --

-- 1 --

esMultiploDeTres :: Number -> Bool
esMultiploDeTres num = rem num 3 == 0

-- 2 --

esMultiploDe :: Number -> Number -> Bool
esMultiploDe num =  (==0).rem num

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

aumentar :: Number -> Number
aumentar num = num + 1

buscarCuadrado :: Number -> Number -> Bool
buscarCuadrado num contador
                | num == contador ^ 2 = True
                | num > contador ^ 2 = buscarCuadrado num  (aumentar contador)
                | num <  contador ^ 2 = False

esCuadradoPerfecto :: Number -> Bool
esCuadradoPerfecto num = buscarCuadrado num 1

-- Ejercicios 2 --

-- 1 --


-- 2 --


-- 3 --


-- 4 --


-- 5 --


-- 6 --


-- 7 --


-- 8 --


-- 9 --


-- 10 --


-- 11 --