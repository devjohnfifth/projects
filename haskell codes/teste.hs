problem :: String -> String -> String -> String
problem velha nova st = if velha `isInfixOf` st
                        then replace velha nova st
                        else st

replace :: String -> String -> String -> String
replace _ _ [] = []
replace old new str@(x:xs)
  | old `isPrefixOf` str = new ++ drop (length old) str
  | otherwise = x : replace old new xs

isInfixOf :: Eq a => [a] -> [a] -> Bool
isInfixOf [] _ = True
isInfixOf _ [] = False
isInfixOf needle haystack@(x:xs)
  | needle `isPrefixOf` haystack = True
  | otherwise = isInfixOf needle xs

isPrefixOf :: Eq a => [a] -> [a] -> Bool
isPrefixOf [] _ = True
isPrefixOf _ [] = False
isPrefixOf (x:xs) (y:ys)
  | x == y = isPrefixOf xs ys
  | otherwise = False
