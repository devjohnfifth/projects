# 23/03/2023[criar tabela principal e colocar conteudo nela]

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
create database link connectLocalToOltp connect to oltp_query identified by oltp_query using 'oltp';
select * from oltp_2023.sales@connectLocalToOltp;

/

create or replace synonym sales for oltp_2023.sales@connectLocalToOltp;

/
select * from sales;

/

select external_id
from sales
where external_id is not null
group by external_id
order by external_id;

/

select min(external_id)
from sales
where external_id is not null;

/

--1)

CREATE TABLE DESCRICAO (
desc_venda_id number(6),
desc_venda varchar2(50),
grupo_qualidade number(4) not null,
nota_venda number(4) not null,
data_criacao date not null,
primary key(desc_venda_id),
foreign key(grupo_qualidade) references GRUPO_QUALIDADE(grupo_id)
);
/

--2)

create or replace function f_idRandomLookup
return number
is 
    v_id grupo_qualidade.grupo_id%type := 0;
    v_quantidade number(9) := 0;
    v_num number(9):= 0;
begin 
    select count(grupo_id)
    into v_quantidade
    from grupo_qualidade;
    
    v_num := trunc(dbms_random.value(0, v_quantidade));
    
    select grupo_id
    into v_id
    from grupo_qualidade
    offset v_num rows
    fetch first 1 rows only;
    return v_id;

end;

/
create or replace PROCEDURE insert_DESCRICAO_principal
is
    v_desc_venda_id descricao.desc_venda_id%type := 0;
    v_desc_venda descricao.desc_venda%type := 0;
    v_grupo_qualidade descricao.grupo_qualidade%type := 0;
    v_nota_venda descricao.nota_venda%type := 0;
    v_data_criacao descricao.data_criacao%type := to_date('01/01/1900', 'dd/mm/yyyy');
    
    v_count number(6):= 0;
    
    v_valor_min number(6) := 0;
    v_valor_max number(6) := 0;
    v_quantidade number(6):= 0;

begin

    select min(external_id)
    into v_valor_min
    from sales
    where external_id is not null;

    select max(external_id)
    into v_valor_max
    from sales
    where external_id is not null;

    v_quantidade := v_valor_max - v_valor_min ;
    loop
        v_count:=v_count+1;
        v_desc_venda_id := v_count;

        -- aleatorio variaveis

        v_desc_venda_id := v_count;
        v_desc_venda := dbms_random.string('X', trunc(dbms_random.value(10,trunc(dbms_random.value(20,50)))));
        v_data_criacao := to_date( trunc( dbms_random.value(to_char(to_date('01/01/1990', 'dd/mm/yyyy'),'j')    ,  to_char(to_date('01/12/2022', 'dd/mm/yyyy'),'j'))),'j');

        v_grupo_qualidade := f_idRandomLookup();

        -- grupos de qualidade semi aleatorio

        if v_grupo_qualidade = 1 then
            v_nota_venda := trunc(dbms_random.value(1, 200));
        elsif v_grupo_qualidade = 2 then
            v_nota_venda := trunc(dbms_random.value(200, 400));
        elsif v_grupo_qualidade = 3 then
            v_nota_venda := trunc(dbms_random.value(400, 600));
        elsif v_grupo_qualidade = 4 then
            v_nota_venda := trunc(dbms_random.value(600, 800));
        elsif v_grupo_qualidade = 5 then
            v_nota_venda := trunc(dbms_random.value(800, 1001));
        else
            v_nota_venda := -1;       
        end if;

        -- end [grupos de qualidade semi aleatorio]
        -- end [aleatorio variaveis]
        
        insert into descricao (desc_venda_id, desc_venda, grupo_qualidade, nota_venda, data_criacao)  
        values (v_desc_venda_id, v_desc_venda, v_grupo_qualidade, v_nota_venda, v_data_criacao);

    exit when v_count > v_quantidade;
    end loop;

end;
/
delete descricao;
exec insert_DESCRICAO_principal;
/
select * from descricao order by desc_venda_id;
/
--3)
create or replace procedure insert_tables_DESCRICAO
is 
begin 
    delete DESCRICAO;
    delete GRUPO_QUALIDADE;
    insert_GRUPO_QUALIDADE_lookup;
    insert_DESCRICAO_principal;
end;
/
exec insert_tables_DESCRICAO;
Select * from descricao inner join grupo_qualidade 
on grupo_id = grupo_qualidade
order by desc_venda_id;
/
```