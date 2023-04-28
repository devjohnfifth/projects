numEqualMax :: Int -> Int -> Int -> Int
numEqualMax x y z
 | x >= y && x>=z = contaN x x y z
 | y >= z 		= contaN y x y z
 | otherwise 	= contaN z x y z

contaN :: Int -> Int -> Int -> Int -> Int
contaN s x y z
 | s == x && s == y && s == z							= 3
 | s == x && s == y || s == x && s == z || s == y && s == z 	= 2
 | otherwise 									= 1
