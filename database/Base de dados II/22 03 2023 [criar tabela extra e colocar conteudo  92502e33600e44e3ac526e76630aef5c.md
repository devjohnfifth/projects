# 22/03/2023 [criar tabela extra e colocar conteudo nela]

```sql
CREATE TABLE DESCRICAO_VENDA (
desc_venda_id number(6),
desc_venda varchar2(50) not null,
grupo_qualidade number(4) not null,
nota_venda number(4) not null,
primary key(desc_venda_id),
foreign key(grupo_qualidade) references GRUPO_QUALIDADE(grupo_id)
);
```

```sql
--1)
CREATE TABLE GRUPO_QUALIDADE(
grupo_id number(4),
nome_grupo varchar(10) not null,
descricao_grupo varchar2(50),
primary key(grupo_id)
);

/
--2)
CREATE OR REPLACE PROCEDURE insert_GRUPO_QUALIDADE_lookup
IS
BEGIN
    INSERT INTO GRUPO_QUALIDADE(grupo_id, nome_grupo, descricao_grupo) values (1, 'otimo',dbms_random.string('X', CAST(dbms_random.value(10,trunc(dbms_random.value(20,50))) AS integer)));
    INSERT INTO GRUPO_QUALIDADE(grupo_id, nome_grupo, descricao_grupo) values (2, 'bom',dbms_random.string('X', CAST(dbms_random.value(10,trunc(dbms_random.value(20,50))) AS integer)));
    INSERT INTO GRUPO_QUALIDADE(grupo_id, nome_grupo, descricao_grupo) values (3, 'medio',dbms_random.string('X', CAST(dbms_random.value(10,trunc(dbms_random.value(20,50))) AS integer)));
    INSERT INTO GRUPO_QUALIDADE(grupo_id, nome_grupo, descricao_grupo) values (4, 'ruim',dbms_random.string('X', CAST(dbms_random.value(10,trunc(dbms_random.value(20,50))) AS integer)));
    INSERT INTO GRUPO_QUALIDADE(grupo_id, nome_grupo, descricao_grupo) values (5, 'pessimo',dbms_random.string('X', CAST(dbms_random.value(10,trunc(dbms_random.value(20,50))) AS integer)));
END;
/
exec insert_GRUPO_QUALIDADE_lookup;
select * from GRUPO_QUALIDADE;
/
--3)
CREATE OR REPLACE PROCEDURE  insert_tables_GRUPO_QUALIDADE 
IS
BEGIN
  delete GRUPO_QUALIDADE;
  insert_GRUPO_QUALIDADE_lookup;
    
END;
/
exec insert_tables_GRUPO_QUALIDADE ;
select * from GRUPO_QUALIDADE;
/
```