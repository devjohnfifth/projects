{-*=============================================================
 	Nome: 	João Lucas de Melo Quintão
	Numero:	1708654

			AULA 5: CASAMENTO DE PADRÃO
			COMPRAS FATURA
==============================================================*-}


-----------------------------[Recursive Verision]-------------------------------
listaNaoRepete :: [Int] -> [Int]
listaNaoRepete lista = listaNaoRepeteAux lista (lista!!0 + 1)

listaNaoRepeteAux:: [Int] -> Int -> [Int]
listaNaoRepeteAux [] numero                                     = []
listaNaoRepeteAux (cabeca:[]) numero
    |   cabeca /= numero                                        = cabeca:[]
    |   otherwise                                               = []
listaNaoRepeteAux (cabeca:lista)  numero
    |   cabecaOrd  == (head rabo) ||   cabecaOrd == numero      = (listaNaoRepeteAux rabo  cabecaOrd)
    |   otherwise                                               = (cabecaOrd:listaNaoRepeteAux rabo  cabecaOrd)
    where
        vetorOrd   =   quickSort (cabeca:lista)
        cabecaOrd  =   (head vetorOrd)
        rabo            =   (tail vetorOrd)



quickSort :: [Int] -> [Int]
quickSort [] = []
quickSort (x:xs) = quickSort [y | y<-xs, y<=x] ++ [x] ++ quickSort [y | y<-xs, y>x]
-----------------------------[Recursive Verision]-------------------------------


-----------------------------[Interative Verision]-------------------------------
listaNaoRepete2 :: [Int] -> [Int]
listaNaoRepete2 lista = [valor | valor <- lista, ocorreInt lista valor == 1 ]

ocorreInt :: [Int] -> Int -> Int
ocorreInt (cabeca:[]) numero
    |   cabeca == numero    = 1
    |   otherwise           = 0
ocorreInt (cabeca:lista) numero
    |   cabeca == numero    = 1 + ocorreInt lista numero
    |   otherwise           = ocorreInt lista numero   
-----------------------------[Interative Verision]-------------------------------