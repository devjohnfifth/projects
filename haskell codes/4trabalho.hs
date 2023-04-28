{-*=============================================================
 	Nome: 	João Lucas de Melo Quintão
	Numero:	1708654

			AULA 4: TUPLAS E LISTAS
			COMPRAS FATURA
==============================================================*-}

--____________________________________________________[Tipos de dados e BD]__________________________
type Produto = [Char]
type Preco = Int
type CodBarras = Int

type BaseDados = [(CodBarras, Produto, Preco)]

catalogo :: BaseDados
catalogo = [(2145, "Acucar, 1Kg", 79),
		(3712, "Agua s/ gas, 6lt", 152),
		(1174, "Leite M/G, 6lt", 456),
		(5090, "Banana, 1kg", 89),
		(2933, "Corn Fl. Kellogs", 249),
		(5201, "Maca Golden, 1Kg", 119)] 

type TipoCaixa = [CodBarras]
type TipoConta = [(Produto, Preco)]

tamLinha :: Int
tamLinha = 30
--____________________________________________________[Tipos de dados e BD]__________________________

--____________________________________________________[Formatando sentimos]__________________________
formatCent :: Preco -> String
formatCent centimos 
 | centimos < 100 	= "0." ++ show(centimos) ++ " Euros"
 | centimos >= 100	=  show(centimos`div`100) ++ "." ++ formatInt(centimos`mod`100) ++ " Euros" 
 | otherwise 		= "Deu merda"

formatInt :: Preco -> String
formatInt numero
 | numero < 10 		= "0" ++ show(numero)
 | otherwise 		= show(numero)
--____________________________________________________[Formatando sentimos]__________________________

--____________________________________________________[Fatura]_______________________________________
--_______________________LINHA FATURA_______________________
linhaFatura :: (Produto, Preco) -> String
linhaFatura (prod,prec) = prod ++ replicate qtdP '.' ++ formatCent prec ++ "\n"
	where
		qtdP = tamLinha - length prod - length (formatCent prec)
--_______________________LINHA FATURA_______________________

--_______________________FATURA LINHA TOTAL_________________
ultimaLinhaFatura :: TipoConta -> String
ultimaLinhaFatura carrinho =replicate qtdP '.' ++ "TOTAL: " ++ formatCent( sum ([ prec | (prod, prec) <- carrinho ]) - desconto carrinho)
	where
		qtdP = tamLinha - length (formatCent( sum ([ prec | (prod, prec) <- carrinho ]))) - length ("TOTAL: ")
--_______________________FATURA LINHA TOTAL________________

--______________________________[FATURA]_____________________________
fatura :: TipoConta -> String
fatura carrinho = concat[linhaFatura(prod,prec)|(prod,prec)<-carrinho] ++ linhaDesconto(carrinho) ++ ultimaLinhaFatura(carrinho)
--______________________________[FATURA]_____________________________

--_______________________FATURA CODIGO BARRAS_______________
procura :: CodBarras -> (Produto,Preco)
procura codigo 
 | length tupla > 0	= head tupla
 | otherwise 		= ("[Inexistente]",0)
	where
		tupla = [(prod,pre) | (cod,prod,pre) <- catalogo, cod == codigo]
--_______________________FATURA CODIGO BARRAS_______________

--_______________________LISTA FATURA CODIGO BARRAS_________
listaProcura :: TipoCaixa -> TipoConta
listaProcura caixa = [procura codigo|codigo <- caixa]
--_______________________LISTA FATURA CODIGO BARRAS_________

--____________________________________FATURA FINAL________________________________________
imprimeFatura :: TipoCaixa -> String
imprimeFatura caixa = fatura(listaProcura caixa)
--____________________________________FATURA FINAL________________________________________

--_______________________DESCONTO___________________________
desconto :: TipoConta -> Preco
desconto carrinho = (somaTotal`div`100)*100
	where
		somaTotal = (sum[50 | (prod,prec) <- carrinho , prod == "Acucar, 1Kg"])
--_______________________DESCONTO___________________________

--_______________________LNHA DESCONTO______________________
linhaDesconto :: TipoConta -> String
linhaDesconto caixa 
 | desconto caixa > 0		= replicate qtdP '.'++ "DESCONTO: -" ++ formatCent(desconto caixa) ++ "\n" 
 | otherwise 			= ""
	where
		qtdP = tamLinha - length ("DESCONTO: -" ++ formatCent(desconto caixa))
--_______________________LNHA DESCONTO______________________
--____________________________________________________[Fatura]_______________________________________