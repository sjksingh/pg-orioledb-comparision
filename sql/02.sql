-- Top customers by total spending with order statistics
EXPLAIN (ANALYZE, BUFFERS)
SELECT 
    customer_id,
    COUNT(*) as total_orders,
    SUM(total_amount) as total_spent,
    AVG(total_amount) as avg_order_value,
    COUNT(CASE WHEN status = 'completed' THEN 1 END) as completed_orders,
    COUNT(CASE WHEN status = 'cancelled' THEN 1 END) as cancelled_orders,
    MAX(order_date) as last_order_date,
    STRING_AGG(DISTINCT status, ', ') as statuses_used
FROM orders_heap
WHERE total_amount > 100
GROUP BY customer_id
HAVING COUNT(*) >= 5
ORDER BY total_spent DESC
LIMIT 100;


-- Top customers by total spending with order statistics
EXPLAIN (ANALYZE, BUFFERS)
SELECT 
    customer_id,
    COUNT(*) as total_orders,
    SUM(total_amount) as total_spent,
    AVG(total_amount) as avg_order_value,
    COUNT(CASE WHEN status = 'completed' THEN 1 END) as completed_orders,
    COUNT(CASE WHEN status = 'cancelled' THEN 1 END) as cancelled_orders,
    MAX(order_date) as last_order_date,
    STRING_AGG(DISTINCT status, ', ') as statuses_used
FROM orders_oriole
WHERE total_amount > 100
GROUP BY customer_id
HAVING COUNT(*) >= 5
ORDER BY total_spent DESC
LIMIT 100;
