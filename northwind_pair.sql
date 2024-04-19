USE northwind;

SELECT * 
FROM customers;

/*  Ejercicio 4 Conociendo a las empleadas:*/
SELECT employee_id, last_name, first_name
FROM employees;

/*  Ejercicio 5 Conociendo los productos más baratos */
SELECT *
FROM Products
WHERE unit_price BETWEEN 0 AND 5;

/*  Ejercicio 6 Conociendo los productos que no tienen precio */
SELECT *
FROM products
WHERE unit_price IS NULL;

/* Ejercicio 7 Comparando productos */
SELECT *
FROM products
WHERE unit_price < 15 AND product_id < 10;

/*  Ejercicio 8 Cambiando de operadores: */
SELECT *
FROM products
WHERE NOT (unit_price <= 15 AND product_id <= 10);

/*  Ejercicio 9 Conociendo los países: */
SELECT DISTINCT country
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

/*  Ejercicio 10 Conociendo los productos: */
SELECT  product_id, product_name, unit_price
FROM products
WHERE product_id <= 10
ORDER BY product_id;

/*  Ejercicio 11:  Conociendo los productos de manera descendente: */

SELECT product_id, product_name, unit_price
FROM products
ORDER BY product_id DESC
LIMIT 10;

/*  Ejercicio 12:  Mostrar Pedidos: */
SELECT DISTINCT order_id, product_id, unit_price
FROM order_details;

/*  Ejercicio 13:  Pedidos que hay gastado mas: */

SELECT order_id,
       SUM(unit_price * quantity) AS ImporteTotal
FROM order_details
GROUP BY order_id
ORDER BY ImporteTotal DESC
LIMIT 3;

/*  Ejercicio 14:  Los pedidos que están entre las posiciones 5 y 10 de nuestro ranking:: */
SELECT order_id, product_id
FROM (
    SELECT order_id, product_id, SUM(unit_price * quantity) AS ImporteTotal
    FROM order_details
    GROUP BY order_id, product_id
    ORDER BY SUM(unit_price * quantity) DESC
    LIMIT 10 OFFSET 4
) AS top_orders;

/*  Ejercicio 15:  Categorías  BBDD: */

SELECT DISTINCT category_name AS nombre_de_categoria
FROM categories;

/*  Ejercicio 16:  Envios con retraso: */

SELECT DATE_ADD(shipped_date, INTERVAL 5 DAY) AS fecha_retrasada
FROM orders
LIMIT 1000;

/*  Ejercicio 17:  Productos mas rentables: */
SELECT *
FROM products
WHERE unit_price BETWEEN 15 AND 50;

/*  Ejercicio 17: Selecciona los productos con unos precios dados:*/

SELECT *
FROM products
WHERE unit_price IN (18, 19, 20);