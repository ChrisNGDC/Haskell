module Library where
import PdePreludat

-- 1. Numeros

siguiente :: Number -> Number
siguiente = (+ 1)

esPositivo :: Number -> Bool
esPositivo = (> 0)

inversa :: Number -> Number
inversa = (1 /)

-- 2. Temperaturas

celsiusAFarenheit :: Number -> Number
celsiusAFarenheit = (+ 32).(* 1.8)

farenheitACelsius :: Number -> Number
farenheitACelsius = (/ 1.8).(+ (-32))

haceFrioCelsius :: Number -> Bool
haceFrioCelsius = (<= 8)

haceFrioFarenheit :: Number -> Bool
haceFrioFarenheit = haceFrioCelsius.farenheitACelsius

-- 3. Mas numeros!

max' :: Number -> Number -> Number
max' numero1 numero2
                    |numero1 > numero2 = numero1
                    |otherwise = numero2

min' :: Number -> Number -> Number
min' numero1 numero2
                    |numero1 < numero2 = numero1
                    |otherwise = numero2

-- 4. Pinos

pesoPino :: Number -> Number
pesoPino altura = (min' altura 3)* 300 + (altura - (min' altura 3)) * 200

esPesoUtil :: Number -> Bool
esPesoUtil peso = peso >= 400 && peso <= 1000

sirvePino :: Number -> Bool
sirvePino = esPesoUtil.pesoPino
