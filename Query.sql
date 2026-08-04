-- I. Overall Sales
/* 1. Total revenue, total order volume generated over the entire 3-month period */
SELECT 
	round(SUM(price),2) as total_revenue,
    COUNT(*) as order_revenue
FROM mcdonalds_menu_items m
JOIN order_details o
ON o.item_id = m.menu_item_id;

-- separate chart
/* 2. Day-over-day and monthly running cumulative total of sales across the 3 months */
-- Month over month revenue
SELECT
	months,
	SUM(monthly_revenue) OVER (ORDER BY months) as monthly_accumulative_revenue
FROM (
	SELECT 
		month(ORDER_DATE) as months,
		round(SUM(price),2) as monthly_revenue
	FROM mcdonalds_menu_items m
	JOIN order_details o
	ON o.item_id = m.menu_item_id
	GROUP BY month(ORDER_DATE)) A;

-- Daily running revenue
SELECT 
	order_date,
    round(sum(daily_revenue) over(order by order_date),2) as running_revenue_daily
FROM (
	SELECT
		order_date,
        sum(price) as daily_revenue
	FROM mcdonalds_menu_items m
	JOIN order_details o
	ON o.item_id = m.menu_item_id
	GROUP BY order_date
    ) A;

/* 3. Total failed orders and its percentage of the placed orders */
SELECT 
	COUNT(*) as failed_orders,
	CONCAT(COUNT(*)*100/(Select count(*) from order_details),'%') as percentage
FROM order_details o
LEFT JOIN mcdonalds_menu_items m
ON o.item_id = m.menu_item_id
WHERE item_id is null;

/* 4.Average order values (AOV) compare between weekday sales (Monday–Friday) and weekend sales (Saturday–Sunday) */
SELECT 
	CASE WHEN DAYOFWEEK(order_date)in (1,7) THEN 'weekends'
    ELSE 'weekdays' 
    END AS day_type,
    ROUND(AVG(price),2) as average_order
FROM mcdonalds_menu_items m
JOIN order_details o
ON o.item_id = m.menu_item_id
GROUP BY day_type;

########

-- II. Menu Performance & Product Mix
/* 1.What are the top 10 most ordered menu items by total quantity sold over the 3-month period? */
SELECT
	item_id, item_name, count(*) as frequency
FROM mcdonalds_menu_items m
JOIN order_details o
ON o.item_id = m.menu_item_id
GROUP BY item_name, item_id
ORDER BY count(*) DESC
LIMIT 10;

/* 2.Which menu items generated the highest total revenue, and does this match the top items by volume? */
-- Highest total revenue items
SELECT
	item_id, item_name, round(sum(price),2) as revenue
FROM mcdonalds_menu_items m
JOIN order_details o
ON o.item_id = m.menu_item_id
GROUP BY item_name, item_id
ORDER BY sum(price) DESC
LIMIT 10;
-- Matching highest revenue and orders items
SELECT m.item_name, o.item_id
FROM mcdonalds_menu_items m
JOIN order_details o
ON o.item_id = m.menu_item_id 
JOIN (
    SELECT item_id
    FROM order_details
    GROUP BY item_id
    ORDER BY COUNT(*) DESC
    LIMIT 10) A
ON A.item_id = o.item_id
GROUP BY m.item_name, o.item_id
ORDER BY SUM(m.price) DESC;

/* What is the revenue contribution percentage of each menu category (e.g., Breakfast, Burgers, Chicken, Drinks, Desserts)? */
WITH CTE AS (
	SELECT *
	FROM mcdonalds_menu_items m
	JOIN order_details o
	ON o.item_id = m.menu_item_id )
SELECT 
	category,
	CONCAT(round(SUM(price)/(SELECT SUM(price) FROM CTE)*100,2),'%') as percentage
FROM CTE
GROUP BY category
ORDER BY SUM(price)/(SELECT SUM(price) FROM CTE)*100;

/* Are there items that are rarely ordered alone? (Identifying bundle/combo potential)? */
-- choose order w count > 2 -> choose   id matching the order_id in common
WITH CTE AS(
SELECT distinct 
 order_id, item_id
FROM order_details
WHERE order_id IN (SELECT order_id FROM order_details GROUP BY order_id HAVING COUNT(*) >= 2)
and item_id is not null),
CTE1 AS(
SELECT distinct
	c1.order_id,
    LEAST(c1.item_id, c2.item_id) as smaller_id,
    GREATEST(c1.item_id,c2.item_id) as bigger_id
FROM CTE c1
JOIN CTE c2
ON c1.order_id = c2.order_id
WHERE c1.item_id != c2.item_id),
CTE2 AS(
SELECT 
	smaller_id,
	count(*) as small_cnt
FROM CTE1
GROUP BY smaller_id),
CTE3 AS(SELECT 
	bigger_id,
	count(*) as big_cnt
FROM CTE1
GROUP BY bigger_id)
SELECT 
	CONCAT(CTE1.smaller_id,',',CTE1.bigger_id) as Pair,
    COUNT(*) as Pair_cnt,
    CONCAT(ROUND(COUNT(*)*100/small_cnt,2),'%') as Frequency_smaller,
    CONCAT(ROUND(COUNT(*)*100/big_cnt,2),'%') as Frequency_bigger
    
FROM CTE1
JOIN CTE2
on CTE1.smaller_id = CTE2.smaller_id
JOIN CTE3
ON CTE1.bigger_id = CTE3.bigger_id
GROUP BY CTE1.smaller_id,CTE1.bigger_id;

-- III. Consumer Behaviour Analysis
/* Average order value across 3-month transactions */
SELECT	ROUND(AVG(price),2) as AOV
	FROM mcdonalds_menu_items m
	JOIN order_details o
	ON o.item_id = m.menu_item_id;

/* How many items are in an average customer's "basket" per order? */
SELECT
	AVG(orders)
FROM (
	SELECT COUNT(*) as orders
	FROM order_details
	WHERE item_id is not null
	GROUP BY order_id
    )A;
    
/* What percentage of orders containing a core entree (e.g., Big Mac, McChicken) also include a "side" and a "drink"? */
-- CORE ENTREE: burger, wraps, chicken, pasta, sandwich
WITH CTE AS (
SELECT
	order_id,
	item_name,
    category
FROM mcdonalds_menu_items m
	JOIN order_details o
	ON o.item_id = m.menu_item_id
WHERE category NOT IN ('Fries','Shakes','Sides','salad')),
CTE1 AS (
SELECT
	order_id,
	item_name,
    category
FROM mcdonalds_menu_items m
	JOIN order_details o
	ON o.item_id = m.menu_item_id
WHERE category IN  ('Fries','Shakes')),
CTE2 AS(
SELECT distinct CTE.order_id
FROM CTE
JOIN CTE1
ON CTE.order_id = CTE1.order_id
GROUP BY CTE1.category,CTE.order_Id
HAVING COUNT(*)>=2)
SELECT count(*)*100/12097 as Percentage
FROM CTE2;

/* Which day of the week and hour of the day generate the peak order volumes? */
SELECT 'Peak day' AS metric, peak_day AS value FROM (
SELECT 
	dayname(order_date) as peak_day
FROM order_details
GROUP BY dayname(order_date)
ORDER BY COUNT(*) DESC 
LIMIT 1) d
UNION ALL
SELECT 'Peak Hour' AS metric, peak_time as value FROM (

SELECT
	hour(order_time) as peak_time
FROM order_details 
GROUP BY hour(order_time)
ORDER BY COUNT(*) DESC
LIMIT 1) b




















