Rode o script para a tabela Funcionário e implemente as seguintes consultas em SQL:

1)	Selecionar todos os funcionários e todos os seus dados, com e sem *
    1 - select * from func f
    2 - select codigo, nome , salario ,sexo ,idade,uf,cidade,est_civil from func f2 

2)	Na sua opinião, seria possível implementar uma consulta em SQL de modo tal que eventuais tuplas duplicadas fossem removidas? 
Tente Select nome from funcionário. Use select distinct. Compare, interprete, discuta, pense e prossiga. 
    - O select distinct limita dada coluna a elementos unicos, podemos então remover os elementos repetidos utilizando funções agragado a esse tipo de select.

3)	Seria de interesse manter as tuplas duplicadas. Quando? Pra que? Interprete. 
    - Sim, se por algum motivo o usuario precisa ver dados anteriores do usuário, por exemplo um endereço antigo.

4)	E em álgebra, o que naturalmente aconteceria com as tuplas duplicadas? Interprete.
    -

5)	Uma tupla em SQL corresponde a um conjunto de dados ou a um elemento de um conjunto de dados? Quem é elemento e quem é conjunto? Isso faz toda a diferença na hora de implementar operações sobre elemento ou sobre conjunto (UNION, NOT IN, etc.). 
Retorne:
    -Um elemento de um conjunto de dados. o Elemento seria de quem seria os dados, nesse caso do funcionário, já o conjunto seria os funcionáriosde uma empresa.

6)	Retorne o nome de todos os funcionários, seu estado de residência e seus respectivos salários. Ordene por estado (asc) e, em segundo, por salário (desc).
    -select nome, uf, salario from func order by uf asc, salario desc 

7)	Retorne o maior, o menor  e a média dos salários de todos os funcionários.
    -select max(salario),  min(salario), avg(salario) from func;

8)	Retorne o maior, o menor  e a média dos salários de todos os funcionários M e depois repita para as F.
    -select max(salario),  min(salario), avg(salario) from func where sexo = 'm';
    -select max(salario),  min(salario), avg(salario) from func where sexo = 'f';

Daria para apresentar os dois na mesma consulta?  SIM
Daria para apresentar em uma linha os dados dos homens e a segunda linha os das mulheres?
    -select max(salario),  min(salario), avg(salario) , sexo from func group by sexo ;
Daria para apresentar em colunas, mas tudo na mesma linha? 
    - Não
9)	Retorne o a média salarial de todos os funcionários que tenham Teixeira no nome. Cuidado com a similaridade e com a case-sentitiveness.
    -select avg(salario) from func where upper(nome) like  '%%TEIXEIRA%';

10)	Retorne um atributo MedSal com a média dos salários entre todos os funcionários.
    -select avg(salario) as MedSal from func;

11)	Retorne um atributo SomaSal com a soma de todos os salários.
        -select sum(salario) as SomaSal from func;

12)	Retorne o salário do funcionário com o código = y (escolha).
    -select codigo , nome, salario  from func where codigo = 4;

13)	Retorne o nome dos funcionários que moram em Santa Catarina (com tratamento adequado de string).
    -select codigo , nome, uf  from func where UPPER(uf) like 'SC'

14)	Retorne os funcionários com o código 1, 2, 4 e 6 apresentados na ordem alfabética decrescente.
    -select * from func where codigo = 1 or codigo = 2 or codigo = 4 or codigo = 6 order by nome desc 

15)	Retorne um atributo QtdFuncMaster com a quantidade de funcionários que ganham entre 1000 e 2000.
    -select count (codigo) as QtdFuncMaster from func where salario  between 1000 and 2000

16)	Retorne um atributo MedIdade com a média entre as idades dos funcionários.
    -select avg(idade) as MedIdade from func 

17)	Retorne todos os funcionários cujo nome comece com a letra M e não terminem com Teixeira. Varie. 
    -select *  from func where upper(nome) like 'M%' and upper(nome) not like '%TEIXEIRA' 

18)	Atualize a tabla funcionários. Por merecimento, aumente em 10% o salário de todos os funcionários que contenham Marcelo em qualquer parte do nome. Não esqueça que não deve importar a forma como o termo Marcelo está escrito. 
    -update func SET salario = salario * 1.1 where  upper(nome) like '%MARCELO%'

19)	Estenda a consulta anterior. Aumente em mais 10% o salário dos Marcelos, caso o valor total, incluindo aquilo que vc já aumentou na consulta anterior, ainda não esteja na faixa entre 10.000 e 20.000.  
    -update func SET salario = salario * 1.1 where  (upper(nome) like '%MARCELO%' )AND (salario NOT between 10000 AND 20000)


20) Delete os registros cujo nome do funcionário contemple o termo Marcelo.  
    -delete  FROM func  where  (upper(nome) like '%MARCELO%')

21) Delete todos os registros da tabela FUNC. 
    -delete  FROM func  

22) Altere o domínio do atributo FUNC.Codigo para passar a representar um auto-incremento. Caso não consigas alterar o domínio, drope a tabela e a recrie, dessa vez com o código sendo um auto-icremento.
    - O banco de dados não permite a alteração deste tipo, porém o codigo seria: ALTER TABLE public.func ALTER COLUMN codigo TYPE serial USING codigo::serial;

23) Adicione um check no atributo est_civil, que limite os possíveis caracteres a serem informados. 
    -alter table func alter est_civil check (est_civil  in ('S','V','C'))

24) Reinsira os dados na tabela FUNC. Desta vez, não informe manualmente o valor para FUNC.Codigo, já que ele é de incremento automático.
    -INSERT INTO FUNC (nome, salario,sexo,idade,uf,cidade,est_civil)
	VALUES ('Rodrigo Teixeira Cardiloso', 1588, 'm', 25, 'sc', 'Lages', 'Solteiro');

25) Adicione o atributo FUNC.dataAdmissao, do tipo date, utilizando o conceito de domain. Ele servirá para armazenar a data de ingresso de cada funcionário na carreira.
    -

26) Altere o domínio do atributo FUNC.nome para uma dimensão maior.
    -

27) Altere o nome do atributo FUNC.sexo para FUNC.genero.
    -



Create Table Func(
Codigo 	Integer Not Null Primary Key, 
   Nome 	Varchar(30) Not Null,
   Salario 	Numeric(12,2),
   Sexo 	char(1),
   Idade 	Integer,
   Uf 		char (2),
   Cidade 	varchar (40) not null,
   Est_Civil 	char (10));



INSERT INTO FUNC 
	VALUES (1, 'Rodrigo Teixeira Cardiloso', 1588, 'm', 25, 'sc', 'Lages', 'Solteiro');
INSERT INTO FUNC 
	VALUES (2, 'Maria Teixeira Joaquina', 2000, 'f', 23, 'pr', 'Pato Branco', 'Casado');
INSERT INTO FUNC 
	VALUES (4, 'Bastianzinho Benz e Silva', 1000, 'm', 55, 'pr', 'Curitiba', 'Casado');
INSERT INTO FUNC 
	VALUES (3, 'Ana Paulina Teixeirina', 4500, 'f', 34, 'sc', 'Florianópolis', 'Casado');
INSERT INTO FUNC 
	VALUES (5, 'Tonico Vampirino Alves', 1500, 'm', 25, 'sc', 'Sao Paulo', 'Solteiro');
INSERT INTO FUNC 
	VALUES (6, 'Jose de Deus Olivre', 2000, 'm', 35, 'ba', 'Savador', 'Casado');
INSERT INTO FUNC 
	VALUES (7, 'José Bolseiro', 1500, 'm', 30, 'sc', 'Biguaçu', 'Solteiro');
INSERT INTO FUNC 
	VALUES (8, 'Bilbo Sonaro Teixeira', 1000, 'm', 35, 'sc', 'Florianópolis', 'Casado');
INSERT INTO FUNC 
	VALUES (9, 'Jack Alambrado Afora', 1199, 'm', 35, 'rs', 'Nova Petrópolis', 'Solteiro');
INSERT INTO FUNC 
	VALUES (10, 'Jenuina Verginina Silasbileia', 1990, 'f', 35, 'rs', 'Bagé', 'Casado');
INSERT INTO FUNC 
	VALUES (11, 'Jucandré Teixeiré Bolson', 1999, 'm', 35, 'rr', 'Selvinha', 'Solteiro');