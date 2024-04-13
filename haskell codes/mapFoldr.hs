{-*=============================================================
 	Nome: 	João Lucas de Melo Quintão
	Numero:	1708654

			AULA 7:Superior Order Function
==============================================================*-}


--_________________________________[map and foldr]__________________________
squareSum2 :: [Int] -> Int
squareSum2 ns = foldr (+) 0 (map pot2 ns)
    where
        pot2 x = x^2
--_________________________________[map and foldr]__________________________
