create database oe;
use oe;
select * from categories_tab;
select * from customers;
select * from order_items;
select * from orders;
select * from product_information;

-- 1.Вывести имя, фамилию покупателей и даты их заказов(order_date).

select t1.ORDER_DATE, t2.CUST_FIRST_NAME as Cust_name, t2.CUST_LAST_NAME as Cust_lastname
from orders as t1
join customers as t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID;

-- 2.Вывести даты заказов продуктов и описание этих продуктов(product_description).

select t1.ORDER_DATE, t2.PRODUCT_DESCRIPTION, t3.PRODUCT_ID
from orders as t1
join order_items as t3
on t1.ORDER_ID = t3.ORDER_ID
join product_information as t2
on t3.PRODUCT_ID = t2.PRODUCT_ID;

-- 3.Вывести имя, фамилию покупателей, даты заказов(orderdate), описание продуктов, которые они заказали 
-- и категории соответствующих продуктов (categoryname).

select t1.CUST_FIRST_NAME as Cust_name, t1.CUST_LAST_NAME as Cust_lastname, t2.ORDER_DATE as Order_date, t3.PRODUCT_DESCRIPTION as Prod_descr, t4.CATEGORY_NAME as Categ_name
from customers as t1
join orders as t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
join order_items as t5
on t2.ORDER_ID = t5.ORDER_ID
join product_information as t3
on t5.PRODUCT_ID = t3.PRODUCT_ID
join categories_tab as t4
on t3.CATEGORY_ID = t4.CATEGORY_ID;

-- 4.Вывести названия(productname), описания категорий(categorydescription) и количества(quantity) тех продуктов, 
-- у которых минимальная стоимость (min_price) больше 300.

select t1.PRODUCT_NAME, t2.CATEGORY_DESCRIPTION as CATEG_DESCR, t3.QUANTITY, t1.min_price
from product_information as t1
join categories_tab as t2
on t1.CATEGORY_ID = t2.CATEGORY_ID
join order_items as t3
on t1.PRODUCT_ID = t3.PRODUCT_ID
where min_price > 300;

-- 5.Вывести имя, фамилию всех женатых мужчин покупателей, которые купили продукты со стоимостью (list_price) больше 550.

 select t1.CUST_FIRST_NAME as custom_name, t1.CUST_LAST_NAME as custom_lastname, t1.MARITAL_STATUS as mar_status, t3.PRODUCT_NAME as prod_name, t3.LIST_PRICE as price
from customers as t1
join orders as t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
join order_items as t4
on t2.ORDER_ID = t4.ORDER_ID
join product_information as t3
on t3.PRODUCT_ID = t4.PRODUCT_ID 
where MARITAL_STATUS = 'married' and
LIST_PRICE > 550;

-- 6.Вывести те продукты(productname), которых нет в заказанных (таблица orderitems).

select t1.PRODUCT_NAME
from product_information as t1
left join order_items as t2
on t1.PRODUCT_ID = t2.PRODUCT_ID
where t2.ORDER_ID is null;


-- 7.Вывести покупателей(custfirstname, custlastname), которые ничего не заказали (таблица orders).

select t1.CUST_FIRST_NAME, t1.CUST_LAST_NAME
from customers as t1
left join orders as t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
where t2.ORDER_ID is null;
