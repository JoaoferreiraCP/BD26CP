/*(1.5 pt) Retorne o ID (de o nome ID FONTE) e a descricao (de o nome FONTE) de todas as fontes de 
dados da fabrica. Caso a fonte esteja relacionada a um determinado protocolo, mostre tambem o 
nome desse protocolo e o seu formato. Ordene o resultado alfabeticamente pelo nome da fonte.
Entregue 2 respostas: uma usando JOIN e a outra usando a operacao de produto cartesiano.
*/
select source.id_source as ID FONTE, "source".source_name as Fonte, p.desc_protocol  from "source"  left join protocol p  on "source".id_protocol  = p.id_protocol order by source_name ;
/*Nao da para fazer*/
/*2) (2 pts) Faca uma consulta que retorne 3 valores medios:
    (i) a media da temperatura (ponto de dados 4); 
    (ii) a media da luminosidade (ponto de dados 8); e
    (iii) a media de humidade (ponto de dados 9). 
A consulta deve incidir sobre o periodo de 02 a 05 de marco de 2021. Junto aos calculos da funcao, 
identifique de que se trata o valor, ou seja, a descricao do ponto e o tipo do ponto medido. Finalmente, 
implemente uma restricao para garantir que so sejam apresentados resultados cujo retorno de funcao
seja maior do que 20. */
select avg(m.measured_data) as media, (select distinct  p.desc_point from point p, measure m2 where p.id_point = m2.id_point  and m2.id_point =4 )as sensor ,  (select distinct t.desc_type from typepoint t, point p2, measure m3  where t.id_type = p2.id_type  and p2.id_point  = m3.id_point and m3.id_point =4 ) as tipo from measure m where m.id_point = 4 and m.time_collect between '02-03-2021' and '05-03-2021' having  avg(m.measured_data)>20
union
select avg(m.measured_data) as media, (select distinct  p.desc_point from point p, measure m2 where p.id_point = m2.id_point  and m2.id_point =3 )as sensor ,  (select distinct t.desc_type from typepoint t, point p2, measure m3  where t.id_type = p2.id_type  and p2.id_point  = m3.id_point and m3.id_point =3 ) as tipo from measure m where m.id_point = 3 and m.time_collect between '02-03-2021' and '05-03-2021' having  avg(m.measured_data)>20
union  
select avg(m.measured_data) as media, (select distinct  p.desc_point from point p, measure m2 where p.id_point = m2.id_point  and m2.id_point =9 )as sensor ,  (select distinct t.desc_type from typepoint t, point p2, measure m3  where t.id_type = p2.id_type  and p2.id_point  = m3.id_point and m3.id_point =9 ) as tipo from measure m where m.id_point = 9 and m.time_collect between '02-03-2021' and '05-03-2021' having  avg(m.measured_data)>20

/*3) (2 pts) Faca uma consulta que retorne: media, minima, maxima e quantidade de coletas para o 
indice de temperatura (ponto 4) do setor de montagem (fonte 1) da pequena fabrica. Complemente 
com uma descricao (DADOS DE) junto ao nome do ponto, como mostra o exemplo de saida abaixo.*/ 

select concat('Dados de: ',(select distinct p.desc_point from point p, measure m2  where p.id_point = m2.id_point and m2.id_point = 4)) as "FONTE",
avg(m.measured_data) as "MED",
max(m.measured_data) as "MAX", 
min(m.measured_data)as "MIN",
count(m.measured_data)as "QTD"
from measure m  where  m.id_point = 4 


/*4) (1.5 pt) Implemente uma consulta que retorne quantas vezes cada protocolo ja foi utilizado para 
configurar pontos de dados da pequena fabrica. Ordene por aqueles que mais foram utilizados. 
Juntamente, informe o nome do protocolo. Caso um protocolo nunca tenha sido utilizado, ainda 
assim ele deve constar na lista, mesmo que a contagem seja 0.*/

select count(s.id_protocol), p.desc_protocol  from "source" s
right join protocol p 
	on s.id_protocol = p.id_protocol 
group by p.desc_protocol 
order by count(s.id_protocol) desc 


/*5) (3.0 pts) Implemente uma consulta que retorne o nome de cada ponto de dados, acompanhado da
quantidade total de medicoes ja obtidas desse ponto e do valor medio historico dessas medicoes. 
Desse total historico de medicoes do ponto, informe quantas delas foram feitas no dia D (escolha um 
dia). Maiores detalhes:
 A consulta deve retornar, para cada ponto: 
o 2 linhas: uma com os dados historicos e outra com os dados do dia D, caso haja;
o 1 linha: somente com os dados historicos, caso nao haja dados do dia D. 
 Mesmo que um ponto nao tenha medicao registrada (nem no dia D e nem historica), mostre sua 
descricao, ainda que as funcoes retornem 0.
 Adicione uma descricao constante para uma coluna chamada 'Tipo_Medicao'. Sua funcao e 
identificar o perfil de cada linha, ou seja, se e dado historico ou se e dado do dia D. 
 Ordene primeiro pelo nome do ponto e, depois, pela quantidade DESCENDENTE de medicoes. 
Exemplo de retorno:*/
