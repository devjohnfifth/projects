
average :: Float -> Float -> Float
average a b =  (a+b)/2



--EXE_4
--CALCULAR O square DE UM INTEIRO
--square 2 =4

square :: Int -> Int
square n = n^2


--EXE_5
--CALCULAR O ABSOLUTe DE UM INTEIRO
--ABSOLUTe -2 = 2

absolute :: Int -> Int
absolute n
 | n >= 0 		= n
 | otherwise 	= -n



--EXE_6
--Verifica se um numero[n] e MULTIPLe de outro[m]
--multiple 4 2 = 0
--multiple 4 3 = 1

multiple :: Int -> Int -> Int
multiple n m = n`mod` m
 



--EXE_7
--Verifica se um numero e odd
--odd 

odd :: Int -> Bool
odd n
 | (n `mod` 2) == 0 = False
 | otherwise = True
 

--EXE_8
--Verifica se 3 numerosinterios sao equals
--equals 4 4 4 = true 

equals :: Int -> Int -> Int -> Bool
equals m n p = (m==n) && (n==p)



--EXE_9
--Verifica o maior entre 3 numeros interios 
--max 4 4 4 = true 

max3 :: Int -> Int -> Int -> Int
max3 m n p 
 | m >= n = max m p
 | otherwise = max n p


--EXE_11
--Verificao a meida entre 3 numeros interios 
--max 4 4 4 = true 

average3f :: Float -> Float -> Float -> Float
average3f a b c = ( (min3f a b c) + (max3f a b c) ) / 2.0


min3f :: Float -> Float -> Float -> Float
min3f a b c 
 | a<=b 	= minf a c
 | otherwise = minf b c


minf :: Float -> Float -> Float
minf a b 
 | a <= b 	= a
 |otherwise	= b


maxf :: Float -> Float -> Float
maxf a b
 | a>=b 		= a
 | otherwise	= b

max3f :: Float -> Float -> Float -> Float
max3f m n p 
 | m >= n = maxf m p
 | otherwise = maxf n p

--EXE_12
--O square do sucessor do maior inteiro

quadSucessor :: Int -> Int -> Int -> Int
quadSucessor a b c = square(max3 a b c + 1)


--EXE_13
--Dados 4 valores mapelos na sua soma se a divisao da soma por 5 for exata entao mapealos em 0 caso contrario
 
ifDiv5Plus :: Int -> Int -> Int -> Int -> Int
ifDiv5Plus a b c d
 | (a+b+c+d)`mod`5 == 0 = (a+b+c+d)
 | otherwise = 0


--EXE_14
--AREA E PERIMETRO DE UM CIRCULO

circleArea :: Float -> Float
circleArea r = pi * (r^2) 

circlePerimeter :: Float -> Float
circlePerimeter r = 2 * pi * r



--EXE_15
--CLAUSULA WHERE



f :: Float -> Float -> Float
f x y = (x+z) * (y+z)
 where z = (x+y)/2



--EXE_16
--soma dos naturais


plusNatural :: Int -> Int
plusNatural n = (n *(n+1)) `div` 2






-- <Exercicio para proxima aula>
--maximo divisor comum entre dois inteiros 


mdc :: Int -> Int -> Int 
mdc a b 
 | a`mod`b == 0 = b 
 | b`mod`a == 0 = a
 | a > b = mdc b (a`mod`b)
 | a < b = mdc a (b`mod`a)