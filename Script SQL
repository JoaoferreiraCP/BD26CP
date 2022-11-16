create table func(
RA SERIAL primary key ,
nome varchar,
sexo char
	check (sexo in ('f','F','m','M'))
)

update  func set RA primary key;

INSERT INTO func (nome,sexo) values ('nome','f');

drop table func

Create Table FUNC(
  Codigo   Integer Not Null Primary Key,
   Nome   Varchar(30) Not Null,
   Salario   Numeric(12,2),
   Genero   char(1) not null constraint genero_M_F check (Genero in ('M','F')),
   Idade   Integer,
   Uf   char (2),
   Cidade   varchar (40) not null,
   Est_Civil   char (1) not null check (Est_Civil in ('S', 'C', 'D', 'V', 'U')),
   data_nasc   date
   );
   
  
  INSERT INTO FUNC 
		VALUES (1, 'Rodrigo Cardoso', 1588, 'M', 25, 'sc', 'Lages', 'S','01/08/1980');

INSERT INTO FUNC 
		VALUES (2, 'Maria Marcela Joaquina', 2000, 'F', 23, 'pr', 'Pato Branco', 'C','03/05/1985');

	INSERT INTO FUNC
		VALUES (4, 'Marcelo Bastianzinho Silva', 15000, 'M', 55, 'pr', 'Curitiba', 'C','10/10/1990');

	INSERT INTO FUNC
		VALUES (3, 'Ana Paula Marcelos', 4500, 'F', 34, 'sc', 'Florianópolis', 'C','23/01/1975');

	INSERT INTO FUNC
		VALUES (5, 'Tonico Alves', 1500, 'M', 25, 'sc', 'Sao Paulo', 'S','25/02/1989');

	INSERT INTO FUNC
		VALUES (6, 'Jose de Deus', 6000, 'M', 35, 'ba', 'Savador', 'C','12/04/1983'); 

	INSERT INTO FUNC
		VALUES (7, 'Jose Geraldo Marceleza Silva', 12000, 'M', 24, 'AC', 'Rio Alerta', 'S','01/05/1995'); 

	INSERT INTO FUNC
		VALUES (8, 'Marcelo Jose Tanosbares', 15000, 'M', 40, 'rs', 'Soledade', 'D','15/09/2000'); 

	INSERT INTO FUNC
		VALUES (9, 'Maria das Vasmarcelos', 15000, 'F', 18, 'AM', 'Manaus', 'V','01/10/1998'); 

	INSERT INTO FUNC 
		VALUES (10, 'Jacira Caninana dos Patos', 8000, 'F', 23, 'sp', 'Carai', 'C','28/11/1989'); 

	INSERT INTO FUNC
		VALUES (11, 'Valete Juvenal Odioso', 9000, 'M', 30, 'SP', 'São Paulo', 'U','30/09/1979'); 

	INSERT INTO FUNC
		VALUES (12, 'Juracioso Pedroso Trancoso', 8000, 'M', 44, 'pr', 'Rolandia', 'S','15/06/1980'); 

	INSERT INTO FUNC
		VALUES (13, 'Luciel dos Pastel', 5000, 'F', 48, 'RS', 'Não Me Toque', 'V','23/07/2001'); 	
		
	INSERT INTO FUNC
		VALUES (14, 'Lorencina Alvarrenga Marcelo', 20000, 'F', 59, 'TO', 'Palmas', 'U','09/10/1992'); 

	INSERT INTO FUNC
		VALUES (15, 'Zeduardo Lapradaria', 1000, 'M', 25, 'SC', 'Blumenau', 'C','18/12/1990'); 
		
	
	select * from func f  order by uf asc, idade desc
	

select count(*) as qtde_func from func ;

select count(func.codigo) as fubc_sc from func where upper(uf) = upper('sc');

select count(func.codigo) as qtde_sexo_informado from func where genero not like '';

select avg(func.idade) as med_idade from func;

select min(func.idade) as menor_idade from func;

select count(func.codigo), func.uf from func group by uf order by uf; 
select count(func.codigo), func.uf from func where est_civil ='C' and genero = 'M' group by uf order by uf; 

select avg(func.idade), func.est_civil, func.cidade  from func group by func.est_civil, func.cidade  order by est_civil  ;
select avg(func.idade) as media, func.est_civil, func.cidade  from func group by func.est_civil, func.cidade having avg(func.idade)>22 order by est_civil ;


select avg(func.salario) from func where upper(func.uf)= 'BA';
select avg(func.salario), uf from func group by uf order by uf;

select avg(func.salario), genero from func group by genero order by genero ;
select avg(func.idade) from func where func.salario  between 10000 and 15000;
select nome, salario  from func where salario = (select max(func.salario) from func);
select nome, salario from func where salario > (select avg (salario) from func) order by salario;
