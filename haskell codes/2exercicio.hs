{-*=============================================================
 	Nome: 	João Lucas de Melo Quintão
	Numero:	1708654

			AULA 2: figuras
==============================================================*-}





{-*=====================================================================================================

EXERCICIO DE ENTREGA DA AULA 2 (TRABALHO3)



printPicture (above 	(sideBySide  (flipV horse) (invertColour horse))	(sideBySide (invertColour (rotate horse)) (flipH horse))) 


printPicture (sideBySide (above (flipV horse) (invertColour (rotate horse))) (above (invertColour horse) (flipH horse))) 

======================================================================================================*-}





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

