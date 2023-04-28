
-- <Exercicio para proxima aula>
--maximo divisor comum entre dois inteiros 


mdc :: Int -> Int -> Int 
mdc a b 
 | a`mod`b == 0 = b 
 | b`mod`a == 0 = a
 | a > b = mdc b (a`mod`b)
 | a < b = mdc a (b`mod`a)