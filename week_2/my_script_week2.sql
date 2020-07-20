#use store_medium;
#select * from product, category;
#select * from product cross join category;
#select * from product inner join category on product.category_id = category.category_id;
#select product.product_name, category.category_name, product.price 
#	from product inner join category on product.category_id = category.category_id;
#select p.product_name, c.category_name, p.price 
#	from product as p inner join category as c on p.category_id = c.category_id;

#Задание
#Выведите все позиций списка товаров принадлежащие какой-либо категории с названиями товаров и названиями категорий. 
#Список должен быть отсортирован по названию товара, названию категории. 
#Для соединения таблиц необходимо использовать оператор INNER JOIN.
#NB! 
#1Выборки, полученные с помощью оператора SELECT могут быть отсортированы по нескольким атрибутам. 
#Для этого необходимо в операторе ORDER BY указать набор атрибутов через запятую в необходимом порядке.
#2В запросе для соединения нескольких источников данных операцию соединения можно использовать многократно. 
#Например, для соединения таблиц A, B и C можно использовать запрос вида:
#SELECT * FROM A
#  INNER JOIN B
#    ON A.b_id = B.id
#  INNER JOIN C
#    ON a.c_id = C.id
#;
#use store;
#select good.name as ProductName, category.name as CategoryName
#	from good inner join category_has_good as c on good.id = c.good_id
#    inner join category on c.category_id = category.id
#    ORDER BY ProductName, CategoryName
#;

#Задание
#Выведите список клиентов (имя, фамилия) и количество заказов данных клиентов, имеющих статус "new".
#NB!
#Если необходимо в результате использовать группировку, то в операторе GROUP BY должны быть указаны все атрибуты, 
#которые не являются аргументами аггрегирующих функций.
#В запросе для соединения нескольких источников данных операцию соединения можно использовать многократно. 
#Например, для соединения таблиц A, B и C можно использовать запрос вида:
#SELECT * FROM A
#  INNER JOIN B
#    ON A.b_id = B.id
#  INNER JOIN C
#    ON a.c_id = C.id;
#select client.first_name, client.last_name, count(1) as new_sale_num
#	from client inner join sale on client.id = sale.client_id
#    inner join status on sale.status_id = status.id where status.name = 'new'
#    GROUP by client.first_name, client.last_name
#    ORDER BY new_sale_num desc;

#use store_medium;
#select * from category as c left outer join product as p on p.category_id = c.category_id;
#select * from product as p right outer join category as c on p.category_id = c.category_id;

#select * from product where price > 900;
#select * from product where price < 100;
#select * from product where price > 900 union select * from product where price < 100;

#Задание
#Выведите список товаров с названиями товаров и названиями категорий, в том числе товаров, не принадлежащих ни одной из категорий.
#NB! В запросе для соединения нескольких источников данных операцию соединения можно использовать многократно. Например, для соединения таблиц A, B и C можно использовать запрос вида:
#SELECT * FROM A
#  LEFT OUTER JOIN B
#    ON A.b_id = B.id
#  LEFT OUTER JOIN C
#    ON a.c_id = C.id;
#use store;
#select good.name as ProductName, category.name as CategoryName from good left outer join category_has_good as c on good.id = c.good_id
#left outer join category on c.category_id = category.id;

#Задание
#Выведите список товаров с названиями категорий, в том числе товаров, не принадлежащих ни к одной из категорий, в том числе категорий не содержащих ни одного товара.
#NB! 
#Полное внешнее соединение в MySQL может быть реализовано в результате операции объединения левого и правого соединений. 
#Например, для полного внешнего соединения таблиц А и B можно использовать запрос вида:
#SELECT *
#  FROM A
#  LEFT OUTER JOIN B
#  ON A.b_id = B.id
#UNION
#SELECT *
#  FROM A
#  RIGHT OUTER JOIN B
#  ON A.b_id = B.id;
#В запросе для соединения нескольких источников данных операцию соединения можно использовать многократно. Например, для соединения таблиц A, B и C можно использовать запрос вида:
#SELECT * FROM A
#  LEFT OUTER JOIN B
#    ON A.b_id = B.id
#  LEFT OUTER JOIN C
#    ON a.c_id = C.id;
#use store;
#select good.name as ProductName, category.name as CategoryName from good left outer join category_has_good as c on good.id = c.good_id
#left outer join category on c.category_id = category.id
#union 
#select good.name as ProductName, category.name as CategoryName from good right outer join category_has_good as c on good.id = c.good_id
#right outer join category on c.category_id = category.id;

#Задание
#Выведите список всех источников клиентов и суммарный объем заказов по каждому источнику. Результат должен включать также записи для источников, по которым не было заказов.
#Ожидаемый формат результата:
#+-------------+----------------+
#| source_name | sale_sum       |
#+-------------+----------------+
#| source 1    | 111.00         |
#| source 2    | 222.00         |
#| source 3    | 333.00         |
#NB! В запросе для соединения нескольких источников данных операцию соединения можно использовать многократно. Например, для соединения таблиц A, B и C можно использовать запрос вида:
#SELECT * FROM A
#  LEFT OUTER JOIN B
#    ON A.b_id = B.id
#  LEFT OUTER JOIN C
#    ON a.c_id = C.id;
#use store;
#select source.name as source_name, sum(sale.sale_sum) as sale_sum from source left outer join client on source.id = client.source_id
#left outer join sale on client.id = sale.client_id group by source_name;

#Задание
#Выведите названия товаров, которые относятся к категории 'Cakes' или фигурируют в заказах текущий статус которых 'delivering'. 
#Результат не должен содержать одинаковых записей. В запросе необходимо использовать оператор UNION для объединения выборок по разным условиям.
#Ожидаемый формат результата:
#+-------------+
#| good_name   |
#+-------------+
#| good 1      |
#| good 2      |
#| good 3      |...
#NB! В запросе для соединения нескольких источников данных операцию соединения можно использовать многократно. 
#Например, для соединения таблиц A, B и C можно использовать запрос вида:
#SELECT * FROM A
#  INNER JOIN B
#    ON A.b_id = B.id
#  INNER JOIN C
#    ON a.c_id = C.id;
#use store;
#select good.name from good inner join category_has_good as c on good.id = c.good_id
#inner join category on c.category_id = category.id where category.name = "Cakes"
#union
#select good.name from good inner join sale_has_good as salehd on good.id = salehd.good_id
#inner join sale on salehd.sale_id = sale.id
#inner join status on sale.status_id = status.id where status.name = "delivering";

#Задание
#Выведите список всех категорий продуктов и количество продаж товаров, относящихся к данной категории. 
#Под количеством продаж товаров подразумевается суммарное количество единиц товара данной категории, фигурирующих в заказах с любым статусом.
#Ожидаемый формат результата:
#+---------------------+----------+
#| name                | sale_num |
#+---------------------+----------+
#| category 1          |       11 |
#| category 2          |       25 |
#| category 3          |       13 |... 
#NB! В запросе для соединения нескольких источников данных операцию соединения можно использовать многократно. 
#Например, для соединения таблиц A, B и C можно использовать запрос вида:
#SELECT * FROM A
#  LEFT OUTER JOIN B
#    ON A.b_id = B.id
#  LEFT OUTER JOIN C
#    ON a.c_id = C.id;
use store;
select category.name as name, count(1) as sale_num from category inner join category_has_good as c on category.id = c.category_id
inner join good on category.id = good.id
LEFT OUTER join sale_has_good as salehd on good.id = salehd.good_id group by name order by sale_num desc;