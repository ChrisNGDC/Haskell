module Library where
import PdePreludat

-- 1. Numeros

siguiente :: Number -> Number
siguiente = (+1)

esPositivo :: Number -> Bool
esPositivo = (>0)

inversa :: Number -> Number
inversa = (1/)

-- 2. Temperaturas

celsiusAFarenheit :: Number -> Number
celsiusAFarenheit temperatura = (temperatura * 1.8) + 32

farenheitACelsius :: Number -> Number
farenheitACelsius temperatura = (temperatura - 32) / 1.8

haceFrioCelsius :: Number -> Bool
haceFrioCelsius = (<=8)

haceFrioFarenheit :: Number -> Bool
haceFrioFarenheit = haceFrioCelsius.farenheitACelsius

-- 3. Mas numeros!

max' :: Number -> Number -> Number
max' numero1 numero2  
                    | numero1 > numero2 = numero1
                    | otherwise = numero2

min' :: Number -> Number -> Number
min' numero1 numero2  
                    | numero1 < numero2 = numero1
                    | otherwise = numero2

-- 4. Pinos

alturaPinoCambioDePeso = 3
pesoPinoPorCentimetroHastaCambio = 3
pesoPinoPorCentimetroDesdeCambio = 2
pesoUtilLimiteInferior = 400
pesoUtilLimiteSuperior = 1000

metrosACentimetros :: Number -> Number
metrosACentimetros = (*100)

pesoHastaCambio :: Number -> Number
pesoHastaCambio altura = metrosACentimetros (min' alturaPinoCambioDePeso altura) * pesoPinoPorCentimetroHastaCambio

pesoDesdeCambio :: Number -> Number
pesoDesdeCambio altura = metrosACentimetros (max' alturaPinoCambioDePeso altura - alturaPinoCambioDePeso) * pesoPinoPorCentimetroDesdeCambio

pesoPino :: Number -> Number
pesoPino altura = pesoHastaCambio altura + pesoDesdeCambio altura

esPesoUtil :: Number -> Bool
esPesoUtil peso = (peso >= pesoUtilLimiteInferior) && (peso <= pesoUtilLimiteSuperior)

sirvePino :: Number -> Bool
sirvePino = esPesoUtil.pesoPino

-- Cosas extras mias

restoMaxMin :: Number -> Number -> Number
restoMaxMin num1 num2 = rem (max' num1 num2) (min' num1 num2)

mcd :: Number -> Number -> Number
mcd num1 num2 
            | restoMaxMin num1 num2 /= 0 = mcd (min' num1 num2) (restoMaxMin num1 num2)
            | otherwise = min' num1 num2

mcm :: Number -> Number -> Number
mcm num1 num2 = (num1 / mcd num1 num2) * num2

-- Ejercicios

-- 1
