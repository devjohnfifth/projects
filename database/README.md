# Database II

```sql
CREATE OR REPLACE FUNCTION triplo_nome(p_nome varchar2)
RETURN NUMBER
IS

BEGIN
    RETURN (3*LENGTH(p_nome));
END;

CREATE OR REPLACE PROCEDURE nome_exibi(p_nome varchar2)
IS
v_triplo number(9):= triplo_nome(p_nome);
v_count number(9):=0;

BEGIN
if v_triplo > 15 then
    dbms_output.put_line(v_triplo||'- grande');
else
    dbms_output.put_line(v_triplo||'- pequeno');
end if;

loop
    v_count:=v_count+1;
    dbms_output.put_line(v_count||'- contagem');
exit when v_count = v_triplo;
end loop;

dbms_output.put_line(v_triplo);
END;

SELECT triplo_nome('Maria Clara') from dual;

Exec nome_exibi('teste');

SELECT SYSDATE FROM dual;
SET SERVEROUTPUT ON;
```

```sql
/
SET SERVEROUTPUT ON;
create or replace procedure numero_id(p_empno number)
is
    v_tamanho segmercado.id%type;
begin
    select id
    into v_tamanho
    from segmercado
    where segmercado.id = p_empno;
    dbms_output.put_line(p_empno);
end;
/
exec numero_id(2);
```

trigger

```sql
create or replace trigger segmercado_i_upper
before insert on SEGMERCADO
for each row
DECLARE
v_DESC SEGMERCADO.DESCRICAO%type;
BEGIN
v_DESC := :NEW.DESCRICAO;
:NEW.DESCRICAO := upper(v_desc); 
END;

insert into segmercado (id, descricao) values(8,'Brinquedos');

select * from segmercado;
```

sequence

```sql
create sequence seq_1;
/
--CURVAL [ULTIMO USADO]
--NEXTVAL [PROXIMO]

select seq_1.nextval from dual;
/
```

ver as tabelas

```sql
select * from cat;
```

```sql
insert into artigos (id, nome, preco, stock, iva_pct) values (1,'Brocolos',1.25, 50, 6);
insert into artigos (id, nome, preco, stock, iva_pct) values (2,'Manteiga',1.79, 20, 6);
insert into artigos (id, nome, preco, stock, iva_pct) values (3,'Pizza',1.55, 30, 23);
insert into artigos (id, nome, preco) values (4,'Chocolate',0.64);
/
create sequence seq_linhas;
/
create sequence seq_faturas
start with 1000;
/
create or replace function insere_fatura(p_nif number)
return number
is
    v_id number(9) := seq_faturas.nextval;
begin
    insert into faturas (id, nif_cliente) values (v_id,p_nif);
    return (v_id);
end;
/
    SET SERVEROUTPUT ON;
    declare 
        v_id number(9);
    begin 
        v_id := insere_fatura(99);
        dbms_output.put_line(v_id);
    end;
/
create or replace procedure insere_linha(p_idFatura number, p_idArtigo number, p_quantidade number)
is
    v_preco number (6,2);
    v_iva number(2);
    
begin
    select artigos.preco
    into v_preco
    from artigos 
    where p_idArtigo = artigos.id;
    
    select artigos.iva_pct
    into v_iva
    from artigos 
    where p_idArtigo = artigos.id;
    
    insert into linhas_fatura(id, faturas_id, artigos_id, preco_unitario ,quantidade, iva_pct ) values (seq_linhas.nextval, p_idFatura, p_idArtigo,v_preco ,p_quantidade, v_iva);
end;

/

exec insere_linha(1000,1,50);

create or replace function testeIdAtual
return number
is 
begin 
return seq_linhas.currval ;
end;

select * from linhas_fatura
where id = testeIdAtual;

/
```


[02/03/2023 [Introdução ao Dataware House]](Base%20de%20dados%20II%2098c26225d79d44f1b87dd29229facf36/02%2003%202023%20%5BIntroduc%CC%A7a%CC%83o%20ao%20Dataware%20House%5D%20ddb20e9ae4e647dba294cd314db4e626.md)

[07/03/2023[Data WareHouse]](Base%20de%20dados%20II%2098c26225d79d44f1b87dd29229facf36/07%2003%202023%5BData%20WareHouse%5D%20baeff76440504fe189ec5bd2ae365dd3.md)

[09/03/2023 [Database link e synonym] ](Base%20de%20dados%20II%2098c26225d79d44f1b87dd29229facf36/09%2003%202023%20%5BDatabase%20link%20e%20synonym%5D%2080087d8dddf041b69ce408fe46911830.md)

[21/03/2023 [dbms_random e offset fetch]](Base%20de%20dados%20II%2098c26225d79d44f1b87dd29229facf36/21%2003%202023%20%5Bdbms_random%20e%20offset%20fetch%5D%204fc43b53d7f74dfcaf33979bb7f21ae2.md)

[22/03/2023 [criar tabela extra e colocar conteudo nela]](Base%20de%20dados%20II%2098c26225d79d44f1b87dd29229facf36/22%2003%202023%20%5Bcriar%20tabela%20extra%20e%20colocar%20conteudo%20%2092502e33600e44e3ac526e76630aef5c.md)

[23/03/2023[criar tabela principal e colocar conteudo nela]](Base%20de%20dados%20II%2098c26225d79d44f1b87dd29229facf36/23%2003%202023%5Bcriar%20tabela%20principal%20e%20colocar%20conteu%205cb33331516f4c4289d8739983a44e16.md)

[28/03/2023[Teoria DW (grandes dimensões, atualização de dimensões, mini-dimensões)]](Base%20de%20dados%20II%2098c26225d79d44f1b87dd29229facf36/28%2003%202023%5BTeoria%20DW%20(grandes%20dimenso%CC%83es,%20atualiza%205a243211cb064648b638efdeb7488ea1.md))

[29/03/2023 [Exercício de criação de uma DW]](Base%20de%20dados%20II%2098c26225d79d44f1b87dd29229facf36/29%2003%202023%20%5BExerci%CC%81cio%20de%20criac%CC%A7a%CC%83o%20de%20uma%20DW%5D%204e094030be9e4201b4bfb4bd689633f0.md)

[DW creates](Base%20de%20dados%20II%2098c26225d79d44f1b87dd29229facf36/DW%20creates%209426c0a8a8cf4d7c9b765b9820807966.md)

[Inserção de dados nas dimensões](Base%20de%20dados%20II%2098c26225d79d44f1b87dd29229facf36/Inserc%CC%A7a%CC%83o%20de%20dados%20nas%20dimenso%CC%83es%2006827d1ae24e449f8664d56f537bfef9.md)