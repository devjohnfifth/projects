{-*=============================================================
 	Nome: 	João Lucas de Melo Quintão
	Numero:	1708654

			AULA 6: Tamanho de palavras
			TOTAL CARACTERS, PALAVRAS E LINHAS
==============================================================*-}
textoStats :: String -> (Int ,Int ,Int )
textoStats text = (caracter, word, line)
    where
            caracter = caracters_count text
            word = words_count text
            line = lines_count text

caracters_count :: String -> Int
caracters_count text = length [caracter | caracter <- text, caracter /= '\n' && caracter /=' ']

words_count :: String -> Int
words_count text = words_count2 (takeOffMultipleSpace (takeOffBreaak text))

takeOffMultipleSpace :: String -> String
takeOffMultipleSpace    []                  =   []
takeOffMultipleSpace    (cabeca:valor:[])
    |   cabeca == ' ' && valor == ' '       =   (cabeca:[])
    |   otherwise                           =   (cabeca:valor:[])
takeOffMultipleSpace    (cabeca:lista)
    |   cabeca == ' ' && head lista == ' '  =   takeOffMultipleSpace (cabeca:(tail lista))  
    |   otherwise                           =   concat [(cabeca:[]) , takeOffMultipleSpace lista]


takeOffBreaak :: String -> String
takeOffBreaak text = [caracter | caracter <- text, caracter /= '\n']

words_count2 :: String -> Int
words_count2 text
    |   text == ""                                          =   0
    |   text!!((length text)-1) /= ' ' && text!!0 /= ' '    =   length[caracter | caracter <- text, caracter == ' '] + 1
    |   text!!((length text)-1) == ' ' && text!!0 == ' '    =   length[caracter | caracter <- text, caracter == ' '] - 1
    |   otherwise                                           =   length[caracter | caracter <- text, caracter == ' ']

lines_count :: String -> Int
lines_count text 
    |   text == ""                          =   0
    |   text!!((length text)-1) == '\n'     =  length[caracter | caracter <- text, caracter == '\n'] 
    |   otherwise                           =  length[caracter | caracter <- text, caracter == '\n'] + 1