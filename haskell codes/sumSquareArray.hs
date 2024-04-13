{-*=============================================================
 	Nome: 	João Lucas de Melo Quintão
	Numero:	1708654

			AULA 7:Superior Order Function
==============================================================*-}


--_________________________________[Sum Square Int]__________________________
squareSum :: [Int] -> Int
squareSum ns = sum (map pot2 ns)
    where
        pot2 x = x^2
--_________________________________[Sum Square Int]__________________________
