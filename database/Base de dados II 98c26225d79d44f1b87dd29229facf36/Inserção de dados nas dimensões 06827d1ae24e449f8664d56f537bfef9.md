# Inserção de dados nas dimensões

Antes de inserir link os dois utilizadores o normal e o extra:

e dar a permissão de select das duas tabelas extras:

→ Código executado na bdii_ei_108654_extra

```sql
grant select on descricao to bdii_ei_1708654;
grant select on grupo_qualidade to bdii_ei_1708654;
```

### Inserção na dimensão_descricaoqualidade

```sql
create synonym descricao for bdii_ei_1708654_extra.descricao;  
create synonym grupo_qualidade for bdii_ei_1708654_extra.grupo_qualidade;
```

```sql
create sequence seq_dim; 
/
create or replace procedure etl_dim_descricaoqualidade
is   
begin 
    insert into dimensão_descriçãoqualidade (id_dimensão_qualidade, id_grupo_qualidade, descricao_grupo_qualidade, id_descricao, desc_descricao, nota_venda)
    select seq_dim.nextval, Grupo_id, Descricao_grupo,DESC_VENDA_ID,DESC_VENDA,NOTA_VENDA
    from descricao inner join grupo_qualidade
    on grupo_qualidade = grupo_id
    where desc_venda_id not in 
    (
        select id_descricao from dimensão_descriçãoqualidade
    );
end; 
/
exec etl_dim_descricaoqualidade;
/
select * from DIMENSÃO_DESCRIÇÃOQUALIDADE;
```

### Inserção na dimensão_cliente

```sql
create sequence seq_dim_cliente; 
/
delete dimensão_cliente;
drop sequence seq_dim_cliente; 
/
create or replace procedure etl_dim_cliente
is   
begin 
    insert into dimensão_cliente
    (
        id_dimensão_cliente, id_cliente, primeiro_nome, ultimo_nome, endereço, genero, email, cidade, estado, país
    )
    
    select seq_dim_cliente.nextval, cust_id, cust_first_name, cust_last_name, cust_street_address, cust_gender, cust_email,city, state_provinces.state_province, country_name
    from customers
    inner join cities 
    on cust_city = city_id
    inner join state_provinces
    on state_provinces.state_province = state_province_id
    inner join countries
    on country = country_id
    where cust_id not in 
    (
        select id_cliente from dimensão_cliente
    )
    and rownum <= 7800;
end;
select * from customers
```

### inserção na dimensão_data

```sql
select to_date('01/01/2023', 'dd/mm/yyyy') from dual;

select to_number(to_char(sysdate,'yyyy'))
from dual;

select to_number(to_char(sysdate,'mm'))
from dual;

select to_number(to_char(sysdate,'dd'))
from dual;

select to_char(3,'00')
from dual;

select last_day(to_date('01/02/'||to_char(sysdate,'yyyy'), 'dd/mm/yyyy'))
from dual;

select last_day(to_date('02', 'mm'))
from dual;

select to_char(last_day(to_date('01/02/'||to_char(sysdate,'yyyy'), 'dd/mm/yyyy')),'dd')
from dual;

select decode( to_number(to_char(last_day(to_date('01/02/'||to_char(sysdate,'yyyy'), 'dd/mm/yyyy')),'dd')),
29,'ano bissexto','ano comum') from dual;
```

![Untitled](Inserc%CC%A7a%CC%83o%20de%20dados%20nas%20dimenso%CC%83es%2006827d1ae24e449f8664d56f537bfef9/Untitled.png)

```sql
SET SERVEROUTPUT ON;
declare
    type t_feriado_array is table of date index by binary_integer;
    v_feriado t_feriado_array;
begin
    v_feriado(1) := sysdate;
    v_feriado(2) := to_date('04/12/2021','dd/mm/yyyy');
    v_feriado(4) := to_date('20/02/2023','dd/mm/yyyy');
    dbms_output.put_line(v_feriado.count);
    dbms_output.put_line(v_feriado(1));
    dbms_output.put_line(v_feriado(2));
    dbms_output.put_line(v_feriado(4));
    dbms_output.put_line(v_feriado.first);
    dbms_output.put_line(v_feriado.last);
    dbms_output.put_line(v_feriado.next(2));
    dbms_output.put_line(v_feriado.next(2));
end;
/

declare
    type t_feriado_array is varray(5) of date;
    v_feriado t_feriado_array;
begin
    v_feriado := t_feriado_array(null,null,null,null,null);
    v_feriado(1) := sysdate;
    v_feriado(2) := to_date('04/12/2021','dd/mm/yyyy');
    v_feriado(4) := to_date('20/02/2023','dd/mm/yyyy');
    dbms_output.put_line(v_feriado.count);
    dbms_output.put_line(v_feriado(1));
    dbms_output.put_line(v_feriado(2));
    dbms_output.put_line(v_feriado(4));
    dbms_output.put_line(v_feriado.first);
    dbms_output.put_line(v_feriado.last);
    dbms_output.put_line(v_feriado.next(2));
    dbms_output.put_line(v_feriado.next(2));
end;
```

```sql
drop sequence seq_dim_date;
/
create sequence seq_dim_date;
create or replace procedure etl_dim_data (p_begin_date date, p_end_date date)
is

    type t_holidays_array is varray(12) of varchar2(20);
    v_holidays t_holidays_array;
    v_holiday number(9);
    
    v_count_loop number(9) := 0;
    v_count_loop_2 number(9) := 0;
    
    v_is_holiday number(1):=0;
    v_week number(1);
    v_day number(2);
    v_month number(2);
    v_year number(4);
    v_day_week number(1);
    v_week_month number(1);
    v_date date := p_begin_date;
    v_week_d varchar2(20);
    v_month_d varchar2(20);
    
    v_dif_beg_end number(9);
    
begin
    v_holidays := t_holidays_array('0601', '0202', '1402', '0803','2104', '0105', '1206', '0710', '1211', '0212', '1512', '2511');
    
    
    v_dif_beg_end :=  (trunc(p_end_date) - trunc(p_begin_date)) + 1;
    
    --_________________________________________loop construction__________________________________________ 
    loop
    
        v_day := to_number(to_char(v_date,'dd'));
        v_month := to_number(to_char(v_date,'mm'));
        v_year := to_number(to_char(v_date,'yyyy'));
        v_day_week := to_number(to_char(v_date,'d'));
        v_week_month := to_number(to_char(v_date,'W'));
        v_week_d := to_char(v_date,'day');
        v_month_d := to_char(v_date,'month');
        
        --_____________calculate day of week____________
         if v_day_week = 1 then 
            v_week := 0;
         elsif v_day_week =7 then 
            v_week := 0;
        else
            v_week :=1;
         end if;
         --_____________calculate day of week____________
        
        --______________calculate is holiday_____________
        v_holiday := v_holidays.first;
        v_is_holiday := 0;
        while v_holiday is not null and v_is_holiday < 1
        loop
             if to_char(v_date,'ddmm') = v_holidays(v_holiday) then
                v_is_holiday := 1;
            else
                v_is_holiday := 0;
            end if;
                
            v_holiday :=  v_holidays.next(v_holiday);
           dbms_output.put_line('deu');
        end loop;
        
        
        --______________calculate is holiday_____________
        
        insert into dim_date (idsk_date,day_n, month_n, year_n, number_day_week, week_n, number_week, holiday, date_n, week_d, month_d)
        values(seq_dim_date.nextval, v_day, v_month, v_year, v_day_week, v_week , v_week_month, v_is_holiday, v_date, v_week_d, v_month_d);
        
        
        --counts
        v_date := v_date + 1;
        v_count_loop := v_count_loop + 1;
        --counts
        exit when v_count_loop = v_dif_beg_end;
    end loop;
    --_________________________________________loop construction__________________________________________ 
end;
/

exec etl_dim_data(to_date('07/02/2021','dd/mm/yyyy'),to_date('22/02/2025','dd/mm/yyyy'));
/
delete dim_date;
/
select * from dim_date;
/
select  trunc(sysdate) - to_date('01/01/2023','dd/mm/yyyy') from dual;
```

### inserção na dimensão produto e na minidimensão grupo

```sql
create or replace function etl_minidim_group_price(p_price number)
return number
is
    v_group_price minidim_group_price.id_group_price%type;
    v_group_description varchar2(100);
    v_control number(1);
begin
    if p_price >= 0 and p_price <10 then
        v_group_price := 1; v_group_description := 'Product value is between 0 and 10 Euros';
    elsif p_price >= 10 and p_price <30 then
        v_group_price := 2; v_group_description := 'Product value is between 10 and 30 Euros';
    elsif p_price >= 30 and p_price <60 then
        v_group_price := 3; v_group_description := 'Product value is between 30 and 60 Euros';
    elsif p_price >= 60 and p_price <100 then
        v_group_price := 4; v_group_description := 'Product value is between 60 and 100 Euros';
    elsif p_price >= 100 and p_price <150 then
        v_group_price := 5; v_group_description := 'Product value is between 100 and 150 Euros';
    else 
        v_group_price := 6; v_group_description := 'Product value is more than 150 Euros';
    end if;
    
    select count(v_group_price)
    into v_control
    from dual
    where v_group_price not in (
    select id_group_price
    from minidim_group_price);

    if (v_control = 1) then
        insert into minidim_group_price (id_group_price, group_description) 
        values (v_group_price, v_group_description);
    end if;
 
    return v_group_price;
end;

/
create sequence seq_dim_products;
create or replace procedure etl_dim_products 
is
begin
    insert into dim_products
    (
        idsk_products, id_product, product_name, product_description, current_price,minidim_group
    )
    select seq_dim_products.nextval, prod_id, prod_name, prod_desc, prod_list_price, etl_minidim_group_price(prod_list_price)
    from products 
    inner join product_descriptions 
    on prod_descriptions_id = prod_desc_id;
    end;
/
exec etl_dim_products;
/
select * from dim_products;
select * from minidim_group_price;
/
select * from products
where ROWNUM < 100;
/
select * from product_descriptions where rownum <100; 
/
delete dim_products;
delete minidim_group_price;
drop sequence seq_dim_products;
```