--
--Programacao Funcional
--Aula de 13 de marco de 2023
--

--EXE_1
--CALCULAR O MAIOR DE 2 NUMEROS
--maior entre 2 e 3 = 3



--EXE_3
--CALCULAR A MEDIA ARITIMETICA ENTRE DOIS VALORES
--media 2 e 3 = 2.5

media :: Float -> Float -> Float
media a b =  (a+b)/2



--EXE_4
--CALCULAR O QUADRADO DE UM INTEIRO
--quadrado 2 =4

quadrado :: Int -> Int
quadrado n = n^2


--EXE_5
--CALCULAR O ABSOLUTO DE UM INTEIRO
--ABSOLUTO -2 = 2

absoluto :: Int -> Int
absoluto n
 | n >= 0 		= n
 | otherwise 	= -n



--EXE_6
--Verifica se um numero[n] e MULTIPLO de outro[m]
--multiplo 4 2 = 0
--multiplo 4 3 = 1

multiplo :: Int -> Int -> Int
multiplo n m = n`mod` m
 



--EXE_7
--Verifica se um numero e IMPAR
--IMPAR 

impar :: Int -> Bool
impar n
 | (n `mod` 2) == 0 = False
 | otherwise = True
 

--EXE_8
--Verifica se 3 numerosinterios sao iguais
--iguais 4 4 4 = true 

iguais :: Int -> Int -> Int -> Bool
iguais m n p = (m==n) && (n==p)



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

media3f :: Float -> Float -> Float -> Float
media3f a b c = ( (min3f a b c) + (max3f a b c) ) / 2.0


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
--O quadrado do sucessor do maior inteiro

quadSucessor :: Int -> Int -> Int -> Int
quadSucessor a b c = quadrado(max3 a b c + 1)


--EXE_13
--Dados 4 valores mapelos na sua soma se a divisao da soma por 5 for exata entao mapealos em 0 caso contrario
 
seDiv5Soma :: Int -> Int -> Int -> Int -> Int
seDiv5Soma a b c d
 | (a+b+c+d)`mod`5 == 0 = (a+b+c+d)
 | otherwise = 0


--EXE_14
--AREA E PERIMETRO DE UM CIRCULO

areaCirculo :: Float -> Float
areaCirculo r = pi * (r^2) 

perimetroCirculo :: Float -> Float
perimetroCirculo r = 2 * pi * r



--EXE_15
--CLAUSULA WHERE



f :: Float -> Float -> Float
f x y = (x+z) * (y+z)
 where z = (x+y)/2



--EXE_16
--soma dos naturais


somaNat :: Int -> Int
somaNat n = (n *(n+1)) `div` 2






-- <Exercicio para proxima aula>
--maximo divisor comum entre dois inteiros 


mdc :: Int -> Int -> Int 
mdc a b 
 | a`mod`b == 0 = b 
 | b`mod`a == 0 = a
 | a > b = mdc b (a`mod`b)
 | a < b = mdc a (b`mod`a)