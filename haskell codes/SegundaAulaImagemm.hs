{-*=============================================================
 	Nome: 	João Lucas de Melo Quintão
	Numero:	1708654

			AULA 2: figuras
==============================================================*-}

{-*===============[Declara o tipo]=============== *-}

type Picture = [[Char]]		--String

{-*============================================== *-}



{-*================[Cria Imagens]================ *-}

horse :: Picture
horse =	[".......##...",
		".....##..#..",
		"...##.....#.",
		"..#.......#.",
		"..#...#...#.",
		"..#...###.#.",
		".#....#..##.",
		"..#...#.....",
		"...#...#....",
		"....#..#....",
		".....#.#....",
		"......##...."]

white :: Picture
white =	["............",
		"............",
		"............",
		"............",
		"............",
		"............",
		"............",
		"............",
		"............",
		"............",
		"............",
		"............"]

{-*============================================== *-}


{-*================[Print Imagem]================ *-}

printPicture :: Picture -> IO()
printPicture = putStr.concat.map(++"\n")

{-*============================================== *-}


{-*====================[Flips]=================== *-}

flipH :: Picture -> Picture
flipH = reverse 


flipV :: Picture -> Picture
flipV = map reverse --map aplica em cada elemento ou seja a String

{-*============================================== *-}



{-*====================[rotate]================== *-}

rotate::Picture -> Picture
rotate = flipV.flipH

{-*============================================== *-}



{-*=================[invertColour]=============== *-}

invertColour :: Picture-> Picture
invertColour = map (map invert)


invert :: Char -> Char
invert ch = if ch =='.' then '#' else '.'

{-*============================================== *-}


{-*==============[sideBySide e above]============ *-}

sideBySide :: Picture -> Picture -> Picture
sideBySide = zipWith (++)

above :: Picture -> Picture -> Picture
above = (++)

{-*============================================== *-}


{-*==================[superimpose]=============== *-}

superimpose :: Picture -> Picture -> Picture
superimpose = zipWith (zipWith combineChar)


combineChar :: Char -> Char -> Char
combineChar topCh bottomCh
	= if (topCh == '.' && bottomCh == '.')
	then '.'
	else '#'

{-*============================================== *-}




duplicate :: Char -> String -> IO()
duplicate x = putStr x x

{-*

EX1) Construa com funcoes um mini quadro de xadrez
printPicture (above (sideBySide white (invertColour white)) (sideBySide (invertColour white) white)) 



printPicture (sideBySide (above white (invertColour white)) (above (invertColour white) white)) 

*-}



{-*

EX2) Faca um mini campo de xadrez

printPicture (above (sideBySide (above (sideBySide white (invertColour white)) (sideBySide (invertColour white) white)) (above (sideBySide white (invertColour white)) (sideBySide (invertColour white) white))) (sideBySide (above (sideBySide white (invertColour white)) (sideBySide (invertColour white) white)) (above (sideBySide white (invertColour white)) (sideBySide (invertColour white) white))))

*-}

{-*
EX3) Construa com funcoes um mini quadro de xadrez de cavalos

printPicture (above (sideBySide horse (invertColour horse)) (sideBySide (invertColour horse) horse)) 

printPicture (sideBySide (above horse (invertColour horse)) (above (invertColour horse) horse)) 

*-}


{-*
EX4) Construa com funcoes um mini quadro de xadrez de cavalos os de baixo invertido

printPicture (above (sideBySide horse (invertColour horse)) (sideBySide (invertColour (flipV horse)) (flipV horse))) 

printPicture (sideBySide (above horse (invertColour (flipV horse))) (above (invertColour horse) (flipV horse))) 

*-}



{-*
EX5) Construa com funcoes um mini quadro de xadrez de cavalos os de baixo rodado
printPicture (above (sideBySide horse (invertColour horse)) (sideBySide (invertColour (rotate horse)) (rotate horse))) 

printPicture (sideBySide (above horse (invertColour (rotate horse))) (above (invertColour horse) (rotate horse))) 


*-}

{-*
EX6) Construa com funcoes um mini quadro de xadrez de cavalos os de baixo flipH
printPicture (above (sideBySide horse (invertColour horse)) (sideBySide (invertColour (flipH horse)) (flipH horse))) 

printPicture (sideBySide (above horse (invertColour (flipH horse))) (above (invertColour horse) (flipH horse))) 


*-}


{-*
EX7) Construa com funcoes um mini quadro de xadrez de cavalos os de baixo flipH

printPicture (sideBySide (above horse (invertColour (flipH horse))) (above  (invertColour horse) (flipV (flipH horse)))) 

EX8)



printPicture (above 	(sideBySide  (flipV horse) (invertColour horse))	(sideBySide (invertColour (rotate horse)) (flipH horse))) 


printPicture (sideBySide (above (flipV horse) (invertColour (rotate horse))) (above (invertColour horse) (flipH horse))) 

*-}


