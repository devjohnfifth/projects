{-*=============================================================
 	Nome: 	João Lucas de Melo Quintão
	Numero:	1708654

			AULA 4: LISTAS
==============================================================*-}


--________________________exe1[ordena]_________________________
ordenaTerno :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTerno (a, b, c)
 | a >= b && b >= c		= (c, b, a)
 | a >= c && c >= b		= (b, c ,a)
 | b >= a && a >= c		= (c, a, b)
 | b >= c && c >= a		= (a, c, b)
 | c >= a && a >= b 	= (b, a, c)
 | otherwise			= (a, b, c)
--______________________________________________________________

--________________________exe2[dobro]___________________________
dobro :: [Int] ->[Int] -- lista de inteiros
dobro x = [2*elemento | elemento <- x]
--______________________________________________________________

--_______________________[Lista de numeros primos]______________
isDiv :: Int -> Int -> Bool
isDiv numero divisor = numero`mod`divisor == 0 

listaDiv :: Int -> [Int]
listaDiv  numero = [n | n <- [1..numero], isDiv numero n]

isPrimo :: Int -> Bool
isPrimo numero 
 | length (listaDiv numero) == 2 || numero == 1	= True
 | otherwise 						= False 

listaPrimo :: Int -> [Int]
listaPrimo numero = [n | n <- [1..numero], isPrimo n]
--_______________________________________________________________


