-- Monthly sales summary with status breakdown
EXPLAIN (ANALYZE, BUFFERS) 
SELECT 
    DATE_TRUNC('month', order_date) as month,
    status,
    COUNT(*) as order_count,
    SUM(total_amount) as total_revenue,
    AVG(total_amount) as avg_order_value,
    MIN(total_amount) as min_order,
    MAX(total_amount) as max_order
FROM orders_heap 
WHERE order_date >= CURRENT_DATE - INTERVAL '12 months'
GROUP BY DATE_TRUNC('month', order_date), status
ORDER BY month DESC, status;



-- Monthly sales summary with status breakdown
EXPLAIN (ANALYZE, BUFFERS) 
SELECT 
    DATE_TRUNC('month', order_date) as month,
    status,
    COUNT(*) as order_count,
    SUM(total_amount) as total_revenue,
    AVG(total_amount) as avg_order_value,
    MIN(total_amount) as min_order,
    MAX(total_amount) as max_order
FROM orders_oriole
WHERE order_date >= CURRENT_DATE - INTERVAL '12 months'
GROUP BY DATE_TRUNC('month', order_date), status
ORDER BY month DESC, status;
