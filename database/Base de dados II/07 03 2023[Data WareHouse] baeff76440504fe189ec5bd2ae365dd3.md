# 07/03/2023[Data WareHouse]

## Como criar uma Data WareHouse a partir de um modelo Relacional

- **Tabela de Factos**
    
    • Constituída por atributos numéricos (factos)
    e pelas chaves forasteiras que a ligam à
    tabelas de dimensões;
    • A tabela de factos está bastante
    normalizada;
    • Contém normalmente uma enorme
    quantidade de registo (ocupa vulgarmente
    mais de 95% do espaço da DW).
    
- **Tabelas de Dimensões**
    
    • Há tantas dimensões quantas vertentes sob as quais se pretende analisar os
    factos;
    • As tabelas de dimensões são fortemente desnormalizadas, sendo
    normalmente tabelas com muitos atributos;
    • Normalmente, apesar de terem muitos atributos, contêm poucos registos
    (quando comparados com a tabela de factos).
    

![Untitled](07%2003%202023%5BData%20WareHouse%5D%20baeff76440504fe189ec5bd2ae365dd3/Untitled.png)

1. **Identificar os processos de negócio/actividade** 
2. **Escolher a granularidade dos dados a registar. [nivel de detalhes]**
3. **Identificar dimensões;**
4. **Identificar os factos; [atributos das tabelas de fatctos]**

### 1>**Identificar os processos de negócio/actividade**

- O que a pessoa que irá utilizar deseja ver ?
- Qual informação ?

### 2>**Escolher a granularidade dos dados a registar. [nivel de detalhes]**

- O quanto detalhado será as informações
    - exemplo [nivel de detalhe (cada venda)] {+granularidade} , venda de produtos por  cliente por semana {-granularidade}

### 3>**Identificar dimensões;**

- O nível de detalhe ajuda a entender as dimensões.
    - exemplo, quero ver as vendas por cidade dia e loja [DImenssões de: cidade, loja e datas].
- Adiocionar uma dimensão não necessariamente altera a granularidade.

### 4>**Identificar os factos; [atributos das tabelas de fatctos]**

- Identificar os factos numéricos que constituem cada linha da tabela dos factos  espondendo à seguinte questão: O que estamos a medir?
- Os factos devem estar de acordo com a granularidade definida. Em caso contrário
devem fazer parte de outra tabela de factos.
- Factos típicos são numéricos e aditivos como a quantidade vendida ou o preço de custo.

### Espaço que ocupa uma Data WareHouse

![Untitled](07%2003%202023%5BData%20WareHouse%5D%20baeff76440504fe189ec5bd2ae365dd3/Untitled%201.png)