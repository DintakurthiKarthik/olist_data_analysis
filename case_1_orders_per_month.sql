with first_year as (select  extract(month from order_purchase_timestamp) as month, count(order_id) num_of_orders_2016
from `composed-region-358911.olist.orders_ds`
where  order_purchase_timestamp between "2016-01-01" and "2016-12-31"
group by 1
order by 1),

second_year as (select  extract(month from order_purchase_timestamp) as month, count(order_id) num_of_orders_2017
from `composed-region-358911.olist.orders_ds`
where  order_purchase_timestamp between "2017-01-01" and "2017-12-31"
group by 1
order by 1),

third_year as (
select  extract(month from order_purchase_timestamp) as month, count(order_id) num_of_orders_2018
from `composed-region-358911.olist.orders_ds`
where  order_purchase_timestamp between "2018-01-01" and "2018-12-31"
group by 1
order by 1)


select second_year.month, first_year.num_of_orders_2016, second_year.num_of_orders_2017, third_year.num_of_orders_2018 from first_year right join second_year on second_year.month=first_year.month left join third_year on second_year.month=third_year.month
order by 1
