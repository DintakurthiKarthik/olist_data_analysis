with customers_list as (
  select c.customer_unique_id,o.order_id,o.order_purchase_timestamp from `composed-region-358911.olist.customers_ds` c 
join `composed-region-358911.olist.orders_ds` o on c.customer_id = o.customer_id
),

monthly_data as 
(select order_id, extract(month from order_purchase_timestamp) as month from `composed-region-358911.olist.orders_ds` 
where order_purchase_timestamp between "2017-01-01" and "2017-12-31"  
)

select customer_unique_id,monthly_data.order_id,order_purchase_timestamp,month,rank() over(partition by customers_list.customer_unique_id order by customers_list.order_purchase_timestamp) as rank 
from customers_list join monthly_data on customers_list.order_id=monthly_data.order_id
order by 4,1
