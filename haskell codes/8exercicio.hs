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


--_________________________________[map e filter]____________________________

addUp ns = map fun1 (filter fun2 ns)
    where
        fun2 n = n > 0
        fun1 n = n + 1
--_________________________________[map e filter]____________________________


--_________________________________[Square Int]______________________________
square :: [Int] -> [Int]
square ns = map pot2 ns
    where
        pot2 x = x^2
--_________________________________[Square Int]______________________________


--_________________________________[Sum Square Int]__________________________
squareSum :: [Int] -> Int
squareSum ns = sum (map pot2 ns)
    where
        pot2 x = x^2
--_________________________________[Sum Square Int]__________________________


--_________________________________[All greater zero]_______________________
allGreaterZero :: [Int] -> Bool
allGreaterZero ns = ( ns == filter greaterZero ns)
    where
        greaterZero x = x > 0
--_________________________________[All greater zero]_______________________


--_________________________________[map and foldr]__________________________
squareSum2 :: [Int] -> Int
squareSum2 ns = foldr (+) 0 (map pot2 ns)
    where
        pot2 x = x^2
--_________________________________[map and foldr]__________________________


--_________________________________[Sum square positives]____________________
squareSumPosiive :: [Int] -> Int
squareSumPosiive ns = foldr (+) 0 (map pot2 (filter posi ns))
    where
        pot2 x = x^2
        posi x = x>0
--_________________________________[Sum square positives]____________________



--_________________________________[Iter]____________________________________
iter :: Int -> (Int -> Int) -> Int -> Int
iter n f x = foldr f x (n:[])
    
    where
        double x = x * 2 * x
        sum x = x + x * x
--_________________________________[Iter]____________________________________