{-*=============================================================
 	Nome: 	João Lucas de Melo Quintão
	Numero:	1708654

			AULA 7:Sum square positives
==============================================================*-}

--_________________________________[Sum square positives]__________________________
squareSumPosiive :: [Int] -> Int
squareSumPosiive ns = foldr (+) 0 (map pot2 (filter posi ns))
    where
        pot2 x = x^2
        posi x = x>0
--_________________________________[Sum square positives]__________________________