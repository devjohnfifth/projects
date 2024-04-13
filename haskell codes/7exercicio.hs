{-*=============================================================
 	Nome: 	João Lucas de Melo Quintão
	Numero:	1708654

			AULA 7:trabalhando com palavras
==============================================================*-}
alignText :: String -> Int -> String
alignText text number = takeOffMultipleSpace (takeOffBreaak text)

takeOffMultipleSpace :: String -> String
takeOffMultipleSpace    []                  =   []
takeOffMultipleSpace    (cabeca:valor:[])
    |   cabeca == ' ' && valor == ' '       =   (cabeca:[])
    |   otherwise                           =   (cabeca:valor:[])
takeOffMultipleSpace    (cabeca:lista)
    |   cabeca == ' ' && head lista == ' '  =   takeOffMultipleSpace (lista)
    |   otherwise                           =   concat [(cabeca:[]) , takeOffMultipleSpace lista]

takeOffBreaak :: String -> String
takeOffBreaak text = [caracter | caracter <- text, caracter /= '\n']