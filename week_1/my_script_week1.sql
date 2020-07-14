#use billing_simple;

#select * from billing;
#select payer_email, sum from billing;
#select * from billing where sum>900;
#select * from billing where sum>900 and currency='CHF';
#select * from billing where sum>900 and currency in ('CHF', 'GBP');
#select * from billing where sum>900 and currency not in ('CHF', 'GBP');

#Задание
#Выведите поступления денег от пользователя с email 'vasya@mail.com'.
#В результат включите все столбцы таблицы и не меняйте порядка их вывода.
#select * from billing where payer_email='vasya@mail.com';

#insert into billing values(
#'alex@mail.com',
#'leo@mail.com',
#'500.00', 'MYR',
#'2010-08-20',
#'Here are some money for you');

#select * from billing where payer_email='alex@mail.com' and recipient_email='leo@mail.com' and sum=500.00;

#insert into billing (payer_email, recipient_email, sum, currency, billing_date)
#values(
#'alex@mail.com',
#'leo@mail.com',
#'500.00', 'MYR',
#'2010-08-22');
#select * from billing where payer_email='alex@mail.com' and recipient_email='leo@mail.com' and sum=500.00;

#update billing set currency='USD' where payer_email='alex@mail.com' and recipient_email='leo@mail.com' and sum=500.00;
#select * from billing where payer_email='alex@mail.com' and recipient_email='leo@mail.com' and sum=500.00;

#Задание
#Добавьте в таблицу одну запись о платеже со следующими значениями:
#email плательщика: 'pasha@mail.com' email получателя: 'katya@mail.com' сумма: 300.00 валюта: 'EUR'
#дата операции: 14.02.2016 комментарий: 'Valentines day present)'
#insert into billing values('pasha@mail.com','katya@mail.com','300.00', 'EUR','2016-02-14','Valentines day present)');

#Задание
#Измените адрес плательщика на 'igor@mail.com' для всех записей таблицы, где адрес плательщика 'alex@mail.com'.
#update billing set payer_email='igor@mail.com' where payer_email='alex@mail.com';

#Задание
#Удалите из таблицы записи, где адрес плательщика или адрес получателя установлен в неопределенное значение или пустую строку.
#delete from billing where payer_email='' or payer_email is null or recipient_email='' or recipient_email is null;

use project_simple;

#select * from project;
#select count(1) from project;
#select avg(budget) from project;

#select project_finish, project_start, datediff(project_finish, project_start) from project;
#select project_finish, project_start, datediff(project_finish, project_start) from project where project_finish > project_start;
#select avg(datediff(project_finish, project_start)) from project where project_finish > project_start;

#select 
#	avg(datediff(project_finish, project_start)) as Среднее,
#    max(datediff(project_finish, project_start)) as Максимальное,
#    min(datediff(project_finish, project_start)) as Минимальное
#from project where project_finish > project_start;

#select 
#	avg(datediff(project_finish, project_start)) as Среднее,
#    max(datediff(project_finish, project_start)) as Максимальное,
#    min(datediff(project_finish, project_start)) as Минимальное,
#    client_name as Client
#from project where project_finish > project_start group by client_name;

select 
	avg(datediff(project_finish, project_start)) as Среднее,
    max(datediff(project_finish, project_start)) as Максимальное,
    min(datediff(project_finish, project_start)) as Минимальное,
    client_name as Client
#from project where project_finish > project_start group by client_name order by Максимальное;
from project where project_finish > project_start group by client_name order by Максимальное desc limit 10;

select count(1), avg(budget), client_name from project group by client_name;