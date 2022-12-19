with firstyear as 
(select  extract(week from order_purchase_timestamp) as week, count(*) as count_2016 from `composed-region-358911.olist.orders_ds` 
where order_purchase_timestamp between "2016-01-01" and "2016-12-31"  
group by 1 order by 1 desc),
second as (
select  extract(week from order_purchase_timestamp) as week, count(*) count_2017 from `composed-region-358911.olist.orders_ds` 
where order_purchase_timestamp between "2017-01-01" and "2017-12-31"  
group by 1 order by 1 desc),
third as (
select  extract(week from order_purchase_timestamp) as week, count(*) count_2018 from `composed-region-358911.olist.orders_ds` 
where order_purchase_timestamp between "2018-01-01" and "2018-12-31"  
group by 1 order by 1 desc)

select second.week, firstyear.count_2016, second.count_2017, third.count_2018 from firstyear right join second on second.week=firstyear.week left join third on second.week=third.week
order by 1 desc
