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


/*  Ejercicio 1:Productos más baratos y caros de nuestra BBDD:*/

USE northwind;

SELECT * 
FROM products;

SELECT MIN(unit_price) AS lowestPrice, MAX(unit_price) AS  highestPrice
FROM products;

/*  Ejercicio 2:Productos Y su precio:*/

SELECT unit_price,
       COUNT(product_id) AS total_productos,
       AVG(unit_price) AS precio_promedio
FROM products 
GROUP BY unit_price;

/*  Ejercicio 3: Máxima y mínima carga de los pedidos de UK:*/

SELECT *
FROM orders; 

SELECT ship_country,
 MIN(freight) AS carga_min, MAX(freight) AS  carga_max
FROM orders
WHERE ship_country = "UK";

/*  Ejercicio 4; Qué productos se venden por encima del precio medio:- REVISAR*/

SELECT AVG(unit_price) AS precio_medio
FROM products;


SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products)
ORDER BY unit_price DESC;
/*  Ejercicio 5; Qué productos se han descontinuado:*/

SELECT COUNT(*) AS productos_descontinuados
FROM products
WHERE Discontinued = 1;

/*  Ejercicio 6; Detalles de los productos de la query anterior:*/

SELECT product_id, product_name
FROM products
WHERE Discontinued = 0
ORDER BY product_id DESC
LIMIT 10;

/*  Ejercicio 7; Relación entre número de pedidos y máxima carga:*/

USE northwind;
SELECT employee_id, COUNT(order_id) AS num_pedidos, MAX(freight) AS max_carga
FROM orders
GROUP BY employee_id;

/*  Ejercicio 8; Descartar pedidos sin fecha y ordénalos:*/

SELECT employee_id, COUNT(order_id) AS num_pedidos, MAX(freight) AS max_carga
FROM orders
WHERE shipped_date IS NOT NULL
GROUP BY employee_id
ORDER BY employee_id;

 /*  Ejercicio 9; Números de pedidos por día:*/
 
SELECT DAY(order_date) AS Dia, MONTH(order_date) AS Mes, YEAR(order_date) AS Anio, COUNT(order_id) AS num_pedidos
FROM orders
GROUP BY Dia, Mes, Anio
ORDER BY Anio, Mes, Dia;

 /*  Ejercicio 10; Número de pedidos por mes y año::*/
SELECT MONTH(order_date) AS Mes, YEAR(order_date) AS Anio, COUNT(order_id) AS num_pedidos
FROM orders
GROUP BY Mes, Anio
ORDER BY Anio, Mes;

 /*  Ejercicio 11 Seleccionad las ciudades con 4 o más empleadas: */
SELECT city, COUNT(employees.employee_id) AS num_empleados
FROM employees
JOIN employee_territories ON employees.employee_id = employee_territories.employee_id
GROUP BY employees.city
HAVING COUNT(employee_territories.employee_id) >= 4;
 
 /*Ejercicio 12 Cread una nueva columna basándonos en la cantidad monetaria:: */
 SELECT
    order_id,
    SUM(unit_price * quantity * (1 - discount)) AS total,
    IF(SUM(unit_price * quantity * (1 - discount)) > 2000, 'Alto', 'Bajo') AS Categoria
FROM
 order_details
GROUP BY
   order_id;
 
 
 
 