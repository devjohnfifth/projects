# 28/03/2023[Teoria DW (grandes dimensões, atualização de dimensões, mini-dimensões)]

### Mais de uma estrela

![Untitled](28%2003%202023%5BTeoria%20DW%20(grandes%20dimenso%CC%83es,%20atualiza%205a243211cb064648b638efdeb7488ea1/Untitled.png)

- Dimensão que liga duas tabelas e uma dimensão conforme.
- O Drill across é feito com queries separadas feitas a cada uma das tabelas de
factos, nas quais os cabeçalhos das queries são idênticos (têm as mesmas colunas)
e vêm das mesmas dimensões conformes. A resposta final é o resultado da mescla
dos resultados destas queries. A este processo chama-se stitch ou multipass query
- Nunca se devem fazer queries que unam duas estrelas pelas chaves estrangeiras
dos factos, pois é impossível controlar a cardinalidade da resposta

![Untitled](28%2003%202023%5BTeoria%20DW%20(grandes%20dimenso%CC%83es,%20atualiza%205a243211cb064648b638efdeb7488ea1/Untitled%201.png)

### Factos não aditivos (ou semi-aditivos) [Nas colunas]

> **Aditivos**: Possuem significado, podem ser somados e representam algo
> 

> **Semi-aditivos:** Possuem significado quando somados em pelo menos uma dimensão
> 

> **Não aditivos:** Não possuem significado quando somados [%, temperatura,depende também da logica]
> 

## Flocos de neve (Evitar o uso torna as querys mais dificeis e lentas)

### Grandes dimensões e semi normalização

- Em certas situações dimensões como Produtos ou
Clientes podem ter milhões de registos;
- É muito frequente estas dimensões terem até
uma centena de atributos;Pode ser interessante normalizar
parcialmente estas dimensões

![Untitled](28%2003%202023%5BTeoria%20DW%20(grandes%20dimenso%CC%83es,%20atualiza%205a243211cb064648b638efdeb7488ea1/Untitled%202.png)

- Vantagens
– Economiza espaço;
- Desvantagens
– Aumenta o tempo de resposta a queries;
– Torna a construção das queries mais complexa.

### Alterações em dimensõese Mini Dimensões

**Existe 3 possibilidades:**

1. Escrever por cima (perde-se a história).
2. Inserir registro novo na dimensão com os valores atualizados.
3. Ter atributos na dimenssão que permitem registrar a evolução

(também se podem usar mini-dimensões, quando as dimensões são muito grandes e têm muitaas alterações, como iremos ver mais tarde)

Os tipos são para as colunas.

### Para resolver problemas no tipo 2 quando são muito grandes(mais de 100000 registros), usar mini dimensões

### Mini dimensões

colocar em uma mini tabela de dimensão, apenas as colunas e atributos que alterã LIGADAS A TABELA FATOS  

![Untitled](28%2003%202023%5BTeoria%20DW%20(grandes%20dimenso%CC%83es,%20atualiza%205a243211cb064648b638efdeb7488ea1/Untitled%203.png)

**Mini diimensões:**

![image-1680014164192.jpg3908725322522841879.jpg](28%2003%202023%5BTeoria%20DW%20(grandes%20dimenso%CC%83es,%20atualiza%205a243211cb064648b638efdeb7488ea1/image-1680014164192.jpg3908725322522841879.jpg)

**Flocos de neves:**

![image-1680014305444.jpg2813804644982527385.jpg](28%2003%202023%5BTeoria%20DW%20(grandes%20dimenso%CC%83es,%20atualiza%205a243211cb064648b638efdeb7488ea1/image-1680014305444.jpg2813804644982527385.jpg)

**AS CHAVES DE DADOS DAS DIMENSÕES SÃO SINTETICAS (GERADAS NA HORA, SEQUÊNCIAS) OU ESTRUTURAS**