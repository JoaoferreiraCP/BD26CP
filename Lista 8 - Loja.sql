Lista 8 - Loja

Operações básicas de cruzamento de dados: 

-	Retorne todos os itens alocados a uma dada NF
    select * from notafiscal ;
-	Retorne a quantidade de itens alocados a uma dada NF
    select count(pk_nota), pk_nota from itens, notafiscal where itens.fk_nota = notafiscal.pk_nota group by pk_nota order by pk_nota ;
- 	Implemente uma consulta que, para cada nota fiscal, retorne o valor total da nota, com base no somat�rio dos valores dos itens da nota. 
    select sum((itens.valorunitario-itens.desconto)*itens.quantidade), pk_nota from itens, notafiscal where itens.fk_nota = notafiscal.pk_nota group by pk_nota order by pk_nota ;
- Sobre a afirmativa: "O cálculo da consulta anterior poderia ser usado para atualizar o atributo Valor_Total, da tabela Nota_FiscalEsse". Você concorda? Discorda? Justifique.
    Sim poderia. Apenas seria necessario utilizar a função de atualizar a tabela.
-	Retorne a quantidade de unidades de produtos alocados a uma dada NF
    
-	Retorne a quantidade de unidades de produtos alocados a cada NF
    select sum(itens.quantidade), pk_nota from itens, notafiscal where itens.fk_nota = notafiscal.pk_nota group by pk_nota order by pk_nota ;
-	Retorne o nome dos clientes que compraram mais de x unidades de produtos
    select cliente.nome from cliente, notafiscal, itens where pk_cliente = fk_cliente and pk_nota = fk_nota group by cliente.nome having sum(itens.quantidade) > 10;
-	Retorne o nome dos clientes para os quais foi concedido um montante y de desconto
    select cliente.nome from cliente, notafiscal, itens where pk_cliente = fk_cliente and pk_nota = fk_nota group by cliente.nome having sum(itens.desconto) > 1000;
- 	Retorne o valor total das compras de cada cliente
    select cliente.nome,  sum((itens.valorunitario-itens.desconto)*itens.quantidade) from cliente, notafiscal, itens where pk_cliente = fk_cliente and pk_nota = fk_nota group by cliente.nome;
-	Retorne o valor total das compras de cada cliente, mas restrinja a consulta a determinado período
    select cliente.nome,  sum((itens.valorunitario-itens.desconto)*itens.quantidade) from cliente, notafiscal, itens
    where pk_cliente = fk_cliente and pk_nota = fk_nota and notafiscal."data"  between '2017-01-01' and '2017-02-28' 
    group by cliente.nome;

-	Retorne o valor total das compras de cada cliente, mas restrinja a consulta a determinado período e só considere como resultado válido os clientes que compraram um montante maior do que 50 mil
Implemente consultas adicionais que explorem os conceitos vistos na primeira parte da disciplina. 
    select cliente.nome,  sum((itens.valorunitario-itens.desconto)*itens.quantidade) from cliente, notafiscal, itens
    where pk_cliente = fk_cliente and pk_nota = fk_nota and notafiscal."data"  between '2017-01-01' and '2017-02-28'
    group by cliente.nome having sum((itens.valorunitario-itens.desconto)*itens.quantidade) > 50000 ;


Opera��es com UNION e NOT EXIST:

�	Retorne o nome dos fabricantes que n�o produzem nenhum produto e de clientes que nunca compraram. 
�	Retorne o nome dos fabricantes que produzem algum produto e de clientes que algum dia compraram
�	Retorne o nome dos fabricantes que produzem algum produto e de clientes que algum dia compraram. Caso o fabricante e o cliente possuam o mesmo nome, duas consultas devem ser implementadas, uma apresentando os nomes duplicados, e outra n�o. 
�	Fa�a a uni�o de duas consultas. A primeira deve retornar o n�mero de todas as notas sendo cada um acompanhado pelo nome do respectivo cliente. J� a segunda consulta deve retornar todos os c�digo de produto, acompanhados do respectivo nome. 
�	Retorne o n�mero das notas fiscais que foram abertas, mas que ainda n�o possuem nenhum item alocado.  
�	Retorne o n�mero das notas fiscais e do cliente da nota. Exclua da consulta aquelas notas que n�o possuem nenhum item alocado.
�	Retorne o nome dos clientes que compraram entre x e y unidades de produtos. Implemente a consulta com e sem usar uni�o. 
�	Retorne o nome dos clientes e dos fabricantes. O cliente deve ter comprado ao menos uma vez e o produto deve ter sido alocado a ao menos uma nota fiscal. 





Opera��es com JOINS: 

�	Retorne o nome e o endere�o do fabricante e o nome dos produtos que ele produz. Se n�o fabrica nenhum produto, o fabricante n�o deve ser mostrado
�	Retorne o nome e o endere�o de todos os fabricantes e o nome dos produtos que ele eventualmente produz. 
�	Retorne o nome e o endere�o de todos os fabricantes e o nome dos produtos que ele eventualmente produz. Implemente usando full join e explique se houve alguma diferen�a em rela��o � abordagem usada para implementar o SQL anterior. 
�	Retorne uma lista com os nomes de todos os clientes e o n�mero das notas fiscais que porventura tenham sido lan�adas em seu nome.
�	Retorne uma lista com os nomes dos clientes para os quais uma nota fiscal tenha sido lan�ada.
�	Retorne uma lista com os nomes dos clientes para os quais uma nota fiscal tenha sido lan�ada no �ltimo ano.

Teste o uso de cada tipo de join, em cada um dos SQL acima. Substitua os joins, altere a ordem da jun��o e interprete os resultados.  
