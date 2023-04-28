{-*=============================================================
 	Nome: 	João Lucas de Melo Quintão
	Numero:	1708654

			AULA 3: TUPLAS E LISTAS
==============================================================*-}

test :: [Int] -> [Int]
test n = [elemento *2 | elemento <- n]

par :: [Int] -> [Bool]
par n = [isEven elemento | elemento <- n]

isEven :: Int -> Bool
isEven n = (n`mod`2 == 0)

par2 :: [Int] -> [Int]
par2 n = [elemento*2 | elemento <-n , isEven elemento]


--__________________________________exercicio 1[fatorial]___________________________________
fact :: Int -> Int
fact n
 | n == 0 = 1
 | n > 0 = fact(n-1) * n
 | otherwise = error "fact está definida apenas para números inteiros positivos"

--________________________________________________________________________________



--__________________________________exercicio 2[fibonacci]________________________
fib :: Int -> Int
fib n 
 | n == 1 = 0
 | n == 2 = 1
 | n > 2 = fib(n-1) +fib(n-2)
--________________________________________________________________________________



--__________________________________exercicio 3[fibonacci2]_______________________

proximoFib :: (Int,Int) -> (Int,Int)
proximoFib (u,v) = (v,u+v)

parFib :: Int -> (Int, Int)
parFib n 
 | n<=1		= (0,1)
 | otherwise	= proximoFib(parFib(n-1)) 


termoFib :: Int -> Int
termoFib = fst.parFib

--________________________________________________________________________________




--__________________________________exercicio 4[Soma Fatorial]____________________



somaFat :: Int -> Int
somaFat n
 | n == 0 	= 1
 | n > 0	= somaFat(n-1) + fact n

--________________________________________________________________________________



--__________________________________exercicio 5[min e max]________________________
minEmax :: Int -> Int -> (Int,Int)
minEmax x y
 | x >= y		= (y,x)
 | otherwise	= (x,y)
--________________________________________________________________________________



--__________________________________exercicio 6[Soma valores]_____________________
addPair :: (Int, Int) -> Int
addPair (x,y) = x+y
--________________________________________________________________________________



--__________________________________exercicio 7[max Ocorre]_______________________
maxOcorre :: Int -> Int -> (Int, Int)
maxOcorre x y 
 | x>y 		= (x,1)
 | x==y 		= (x,2)
 | otherwise	= (y,1)
--________________________________________________________________________________




--__________________________________exercicio 8[max Ocorre 3]_______________________
max3Ocorre :: Int -> Int -> Int -> (Int, Int)
max3Ocorre x y z 
 | x > y 		=  	( fst(maxOcorre x ( fst(maxOcorre y z) ) )         ,       snd( maxOcorre x z )   )
 | y > x 		= 	( fst(maxOcorre x ( fst(maxOcorre y z) ) )         ,       snd( maxOcorre y z )   )
 | x > z		=	( fst(maxOcorre x ( fst(maxOcorre y z) ) )         ,       snd( maxOcorre x y )   )
 | otherwise 	=	( fst(maxOcorre x ( fst(maxOcorre y z) ) )         ,       3   )
 
 
--_________________________________________________________________________________
