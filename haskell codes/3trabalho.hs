{-*=============================================================
 	Nome: 	João Lucas de Melo Quintão
	Numero:	1708654

			AULA 3: TUPLAS E LISTAS
==============================================================*-}

--_____________________________________________[max Ocorre]_______________________
maxOcorre :: Int -> Int -> (Int, Int)
maxOcorre x y 
 | x>y 		= (x,1)
 | x==y 		= (x,2)
 | otherwise	= (y,1)
--________________________________________________________________________________

--_____________________________________________[max Ocorre 3]______________________
max3Ocorre :: Int -> Int -> Int -> (Int, Int)
max3Ocorre x y z 
 | x > y 		=  	( fst(maxOcorre x ( fst(maxOcorre y z) ) )         ,       snd( maxOcorre x z )   )
 | y > x 		= 	( fst(maxOcorre x ( fst(maxOcorre y z) ) )         ,       snd( maxOcorre y z )   )
 | x > z		=	( fst(maxOcorre x ( fst(maxOcorre y z) ) )         ,       snd( maxOcorre x y )   )
 | otherwise 	=	( fst(maxOcorre x ( fst(maxOcorre y z) ) )         ,       3   ) 
--_________________________________________________________________________________