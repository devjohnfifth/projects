{-*=============================================================
 	Nome: 	João Lucas de Melo Quintão
	Numero:	1708654

			AULA 7:Superior Order Function
==============================================================*-}

--_________________________________double list[map]________________________
--________________Compretion List___________
dooubleAll :: [Int] -> [Int]
dooubleAll list = [valor * 2 | valor <- list]


--________________Primitive recursive_______
dooubleAll2 :: [Int] -> [Int]
dooubleAll2 [] = []
dooubleAll2 (cabeca:lista) = 2*cabeca : dooubleAll2 lista


--________________Map definition____________
dooubleAll3 :: [Int] -> [Int]
dooubleAll3  xs = map double xs
    where
        double x = 2*x 
--_________________________________double list______________________________