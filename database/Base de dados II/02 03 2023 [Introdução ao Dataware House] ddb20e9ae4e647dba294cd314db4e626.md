# 02/03/2023 [Introdução ao Dataware House]

**INETUM- Empresa**

SDF(SAP DEVELOPMENT FACTORY)

1. Determinacao das necessidades
2. Determinacao do fornecimento
3. Selecao do fornecedor 
4. Pedido
5. Acompanhamento do pedido
6. Recepcao das Mercadoria Gestao de Stock
7. Verificacao de faturas
8. Pagamento

## BD Transacional

Um processo manual virar eletronico

- ACID
- Baixa latencia(velocidade) na hora de inserir dados
- Integridade
- Otimizada para nao ter erro em grande quantidades de introducao
- POR ISSO NORMALIZAR OU DESNORMALIZAR
- Consulta “poucos” registros
- [Nao e otimizada para muitos registros]
- Consultas predefinidas

EU COMO GESTOR QUERO CONSULTAR COM VELOCIDADE E NAO INSERIR

[TODA FATURA DO MES OU OUTRAS CONSULTAS MAIORES]

[Consultas nao definidas]

Por isso desnormalizar

# Introdução ás Datas Warehouse

**Características de uma Data Warehouse**

- Inalterável
- Possui histórico
- Várias BDs
- Orientado ao tema

**Organização:** A primeira característica que vamos ressaltar é justamente a capacidade que o data warehouse possui para organizar as informações – o que é ideal tanto para os operadores da tecnologia como para a liderança poder tomar decisões estratégicas.

**Consistência:** Quando os dados passam do sistema de integração para o ambiente operacional, tudo é feito de forma consistente e padronizada – evitando erros e paradas no sistema.

**Tempo de armazenamento:** O tempo de armazenamento é uma variável importante, pois o data warehouse é capaz de armazenar dados de 5 a 10 anos. Depois disso, os dados operacionais externos são limpos, para remover as inconsistências e, em seguida, integrados, para criar um novo banco de dados mais ajustado à análise corporativa.

**Acesso via intranet:** O acesso aos dados é realizado por meio de intranet, garantindo segurança e facilidade na visualização de relatórios e outros dados necessários.

**Relações:** Precisa extrair uma informação específica? O data warehouse é baseado no sistema relacional, ou seja, os dados  são estruturados e representados em tabelas, também chamados de relações.

Além disso, os dados acessados não recebem nenhum tipo de alteração ou atualização: eles ficam disponíveis apenas para leitura. Isso dá mais segurança aos dados e informações salvas.

[OCUPA MAIS ESPAÇO]

![Captura de tela 2023-03-02 114948.png](02%2003%202023%20%5BIntroduc%CC%A7a%CC%83o%20ao%20Dataware%20House%5D%20ddb20e9ae4e647dba294cd314db4e626/Captura_de_tela_2023-03-02_114948.png)

![Captura de tela 2023-03-02 115029.png](02%2003%202023%20%5BIntroduc%CC%A7a%CC%83o%20ao%20Dataware%20House%5D%20ddb20e9ae4e647dba294cd314db4e626/Captura_de_tela_2023-03-02_115029.png)