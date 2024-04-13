{-*=============================================================
 	Nome: 	João Lucas de Melo Quintão
	Numero:	1708654

			AULA 7:Superior Order Function
==============================================================*-}


--_________________________________[All greater zero]_______________________
allGreaterZero :: [Int] -> Bool
allGreaterZero ns = ( ns == filter greaterZero ns)
    where
        greaterZero x = x > 0
--_________________________________[All greater zero]_______________________

