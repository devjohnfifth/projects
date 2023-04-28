# 21/03/2023 [dbms_random e offset fetch]

# dbms_random

```sql
select dbms_random.value from dual; //entre 0 e 1 [0,1[ aleatorio

select dbms_random.value(10, 100)
from dual;  //pode definir

select dbms_random.string('U', 30)
from dual;

select dbms_random.string('L', 30)
from dual;

select dbms_random.string('A', 30)
from dual;

select dbms_random.string('X', 30)
from dual;

select dbms_random.string('P', 30)
from dual;
/*
U para letras maiusculas
L para as minusculas\
A so letras
X letras e numeros
P calores printaveis
*/

select to_char(sysdate,'dd/mm/yyyy') 
from dual;

select to_char(sysdate,'j') 
from dual;

select to_char(sysdate,'dd/mm/yyyy') 
from dual;

select to_char(to_date('09/04/1968', 'dd/mm/yyyy'),'j') 
from dual;

select dbms_random.value(2439956,2460025)
from dual;

select to_date(2439956,'j')
from dual;

select to_date(2439956,'j')
from dual;
```

### Execicio em aula

Questões sobre dbms_random:

**1 - Faça um select que devolva um número inteiro aleatório entre 1 e 100, inclusive**

**2 - Faça um select que devolva uma palavra formada com caracteres alfanuméricos aleatórios e um comprimento aleatório entre 10 e 30 caracteres, inclusive**

**3 - Faça um select que devolva uma data aleatória entre 15/01/1986 e 23/05/2022, inclusive**

```sql
--1)
select CAST(dbms_random.value(1, 100) AS integer)
from dual;
--2)
select dbms_random.string('X', CAST(dbms_random.value(10, 30) AS integer))
from dual;
--3)
select to_date( CAST( dbms_random.value(to_char(to_date('15/01/1986', 'dd/mm/yyyy'),'j')    ,  to_char(to_date('23/05/2022', 'dd/mm/yyyy'),'j'))AS INTEGER),'j')
from dual;
```

# offset e fetch

```sql
//fetch seleciona as primeiras linhas
//offset pula uma quantia de valores
select * from cat
offset 3 rows;

select * from cat
fetch first 3 rows only;

select * from cat
fetch first 1 rows only;

select * from cat
fetch first rows only;

select * from cat
offset 10 rows
fetch first 5 rows only;

//selecionar registros aleatorios
//buscar o quarto 4 elemento
select * from cat
offset 3 rows
fetch first 1 rows only;
```

### Execicio em aula

Questões sobre dbms_random, offset e fetch:

**1 - Faça um select que devolva do 11º ao 20º registo, inclusive, da tabela PRODUCT_DESCRIPTIONS da instância OLTP quando ordenada por PROD_NAME**

**2 - Crie uma function com o nome random_sale_id que devolva o valor de um sale_id aleatório da tabela sales**

**3 - Teste o código que criou**

```sql
--1)
select * from product_descriptions
order by prod_name
offset 10 rows
fetch first 10 rows only;
/
--2)
create or replace function f_idRandomSale
return number
is 
    v_id sales.sale_id%type := 0;
    v_quantidade number(9) := 0;
    v_num number(9):= 0;
begin 
    select count(sale_id)
    into v_quantidade
    from sales;
    
    v_num := trunc(dbms_random.value(0, v_quantidade));
    
    select cust_id
    into v_id
    from sales
    offset v_num rows
    fetch first 1 rows only;
    return v_id;

end;

/

--3)

select f_idRandomSale() from dual;
```