select  extract(month from order_purchase_timestamp) as month,extract(day from order_purchase_timestamp) as day, count(order_id) num_of_orders
from `composed-region-358911.olist.orders_ds`
where  order_purchase_timestamp between "2017-01-01" and "2017-12-31"
group by 1,2
order by 1,2
