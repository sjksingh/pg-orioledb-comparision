-- Running totals and rankings
EXPLAIN (ANALYZE, BUFFERS)
SELECT 
    order_id,
    customer_id,
    order_date,
    total_amount,
    status,
    SUM(total_amount) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date 
        ROWS UNBOUNDED PRECEDING
    ) as running_total,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id 
        ORDER BY total_amount DESC
    ) as amount_rank,
    LAG(total_amount, 1) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date
    ) as prev_order_amount,
    PERCENT_RANK() OVER (
        ORDER BY total_amount
    ) as amount_percentile
FROM orders_heap
WHERE customer_id IN (
    SELECT customer_id 
    FROM orders_heap 
    GROUP BY customer_id 
    HAVING COUNT(*) > 10
)
ORDER BY customer_id, order_date;



-- Running totals and rankings
EXPLAIN (ANALYZE, BUFFERS)
SELECT 
    order_id,
    customer_id,
    order_date,
    total_amount,
    status,
    SUM(total_amount) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date 
        ROWS UNBOUNDED PRECEDING
    ) as running_total,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id 
        ORDER BY total_amount DESC
    ) as amount_rank,
    LAG(total_amount, 1) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date
    ) as prev_order_amount,
    PERCENT_RANK() OVER (
        ORDER BY total_amount
    ) as amount_percentile
FROM orders_oriole
WHERE customer_id IN (
    SELECT customer_id 
    FROM orders_heap 
    GROUP BY customer_id 
    HAVING COUNT(*) > 10
)
ORDER BY customer_id, order_date;
