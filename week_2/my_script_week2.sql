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