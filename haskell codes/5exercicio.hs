{-*=============================================================
 	Nome: 	João Lucas de Melo Quintão
	Numero:	1708654

			AULA 5: CASAMENTO DE PADRÃO
			COMPRAS FATURA
==============================================================*-}
-- CASAMENTO DE PADRAO
teste :: Int -> Int -> Int
teste 0 y = y
teste x _ = x

-- [1,2,3,4]
-- 1:[2,3,4]
-- x:_

caseOf :: [Int] -> Int
caseOf vetor = 
    case vetor of 
        [] -> 0 
        cabeca:[] -> 1
        cabeca:valor:[] -> 2
        cabeca:valor:valor2:[] -> 3
        cabeca:_ -> (length vetor) 

-- funcao recuriva primitiva [so chama a recursao uma vez de cada vez]
    -- x = fibonacci(0) + fibonacci(1)  NAO PODE
    -- X = FATORIAL(1) PODE

primeiroInt :: [Int] -> Int
primeiroInt [] = -1
primeiroInt (cabeca:_) = cabeca

somar2primeiros :: [Int] -> Int
somar2primeiros [] = 0
somar2primeiros (cabeca:[]) = cabeca
somar2primeiros (cabeca:valor:_) = cabeca + valor

produtoLista :: [Int] -> Int
produtoLista [] = 1 
produtoLista (cabeca:[]) = cabeca
produtoLista (cabeca:valor:lista) = cabeca * produtoLista(valor:lista)

andBool :: [Bool] -> Bool
andBool (cabeca:[]) = cabeca
andBool (cabeca:lista) = cabeca && andBool(lista)

orBool :: [Bool] -> Bool
orBool (cabeca:[]) = cabeca
orBool (cabeca:lista) = cabeca || orBool(lista)

ocorreInt :: [Int] -> Int -> Int
ocorreInt (cabeca:[]) numero
    |   cabeca == numero    = 1
    |   otherwise           = 0
ocorreInt (cabeca:lista) numero
    |   cabeca == numero    = 1 + ocorreInt lista numero
    |   otherwise           = ocorreInt lista numero