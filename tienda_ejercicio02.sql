
-- 1. Los artículos de ropa que puedo encontrar en mi base de datos sabiendo que mi talla es una M o L. (nombre de los artículos) ordenados alfabéticamente por las tallas.

SELECT a.descripcion AS nombre_articulo, t.descripcion AS talla
FROM articulo a JOIN articulo_ropa ar ON a.id=ar.id_articulo
                JOIN talla t ON ar.id_talla=t.id
WHERE t.descripcion = 'M' OR t.descripcion = 'L'
ORDER BY t.descripcion DESC;

-- 2. Los artículos de ropa que puedo encontrar en mi base de datos que sean para el tipo hombre. (nombre del artículo y tallas)
SELECT a.descripcion AS nombre_articulo, tl.descripcion AS talla
FROM articulo a JOIN articulo_ropa ar ON a.id=ar.id_articulo
                JOIN talla tl ON ar.id_talla=tl.id
                JOIN tipo tp ON tp.id=ar.id_tipo
WHERE tp.descripcion = 'Hombre';

SELECT a.descripcion AS nombre_articulo, tl.descripcion AS talla
FROM articulo a JOIN articulo_ropa ar ON a.id=ar.id_articulo
                JOIN talla tl ON ar.id_talla=tl.id
WHERE ar.id_tipo IN (SELECT tp.id FROM tipo tp WHERE tp.descripcion='HOMBRE');
-- 3. La guía de tallas y tipos de todas las camisetas que haya en mi base de datos (nombre del artículo, talla y tipos).
SELECT 
a.descripcion AS nombre_articulo, 
tl.descripcion AS talla,
tp.descripcion AS tipo
FROM articulo a JOIN articulo_ropa ar ON a.id=ar.id_articulo
                JOIN talla tl ON ar.id_talla=tl.id
                JOIN tipo tp ON tp.id=ar.id_tipo;

-- 4. Los artículos que puedo encontrar en base de datos sabiendo que mis medidas son (Teniéndose que cumplir todas las condiciones):
--      a. ancho cuello → entre 3.7 y 8.
SELECT a.descripcion AS nombre_articulo, t.ancho_cuello
FROM articulo a JOIN articulo_ropa ar ON a.id=ar.id_articulo
                JOIN talla t ON ar.id_talla=t.id
WHERE t.ancho_cuello BETWEEN 3.7 AND 8;

--      b. ancho torso → entre 5.2 y 8.7.
SELECT a.descripcion AS nombre_articulo, t.ancho_torso
FROM articulo a JOIN articulo_ropa ar ON a.id=ar.id_articulo
                JOIN talla t ON ar.id_talla=t.id
WHERE t.ancho_torso BETWEEN 5.2 AND 8.7;

--      c. ancho cintura → entre 5.9 y 10.
SELECT a.descripcion AS nombre_articulo, t.ancho_cintura
FROM articulo a JOIN articulo_ropa ar ON a.id=ar.id_articulo
                JOIN talla t ON ar.id_talla=t.id
WHERE t.ancho_cintura BETWEEN 5.9 AND 10;

--      d. largo de manga → entre 5 y 11.
SELECT a.descripcion AS nombre_articulo, t.largo_manga 
FROM articulo a JOIN articulo_ropa ar ON a.id=ar.id_articulo
                JOIN talla t ON ar.id_talla=t.id
WHERE t.largo_manga BETWEEN 5 AND 11;

-- 5. La ropa que puedo comprar para mis hijos , que son los artículos 
que se corresponden a moda juvenil e infantil.
SELECT a.descripcion AS nombre_articulo, t.descripcion
FROM articulo a JOIN articulo_ropa ar ON a.id=ar.id_articulo
                JOIN tipo t ON ar.id_tipo=t.id
WHERE t.descripcion = 'Infantil' OR t.descripcion = 'Moda Joven';

-- 6. El nombre de la prenda y los importes bases de todas las tallas disponibles para esa prenda siempre y cuando la suma de dicho importe sea mayor que 200.
SELECT distinct a.descripcion AS nombre_articulo
FROM articulo a JOIN articulo_ropa ar ON a.id=ar.id_articulo
GROUP BY ar.id_articulo
HAVING SUM(precio_base) > 200;

-- 7. Dado el nombre de un artículo, se ha de poder saber en qué tienda, ciudad y precio se encuentra este artículo, 
al igual que las tallas en las que está disponible y a qué precio se encuentra.
SELECT 
t.id AS Tienda,
t.direccion AS Calle,
t.ciudad AS Ciudad,
ar.precio_base AS Precio,
tl.descripcion AS Talla
FROM articulo a JOIN articulo_ropa ar ON a.id=ar.id_articulo
                JOIN tienda t ON t.id_marca=ar.id_marca
                JOIN talla tl ON ar.id_talla=tl.id
WHERE a.descripcion="Camiseta básica blanca";

-- 8. La diferencia de precio entre los artículos de una tienda 
y su precio base original, calculando también el porcentaje de 
ganancia de la tienda en cada artículo.
SELECT 
a.descripcion,
sa.precio AS precio_final,
ar.precio_base AS precio_base,
sa.precio - ar.precio_base AS beneficio,
(sa.precio - ar.precio_base)/precio_base AS porcentaje_ganancia
FROM articulo a JOIN articulo_ropa ar ON a.id=ar.id_articulo
                JOIN tienda t ON t.id_marca=ar.id_marca
                JOIN stock_articulo sa ON sa.id_tienda=t.id;


-- 9. Todos los artículos de tiendas de ALVARO MORENO sabiendo 
su nombre, talla, y precio.
SELECT 
a.descripcion AS nombre_articulo,
t.descripcion AS talla,
sa.precio AS precio,
mr.descripcion AS tienda
FROM marca_ropa mr JOIN articulo_ropa ar ON mr.id=ar.id_marca
                    JOIN articulo a ON ar.id_articulo=a.id
                    JOIN talla t ON ar.id_talla=t.id
                    JOIN stock_articulo sa ON sa.id_articulo_ropa=ar.id 
WHERE mr.descripcion="ALVARO MORENO";

-- 10.Saber qué artículos tengo disponibles, en qué tiendas y 
en qué ciudades para los tipos de artículos correspondientes a 
moda juvenil, infantil, juvenil, adolescente, moda joven.



-- -------------------------------------------------------------------------------------

DELIMITER $$
CREATE OR REPLACE PROCEDURE
BEGIN

END;
$$
DELIMITER;



DELIMITER $$
CREATE OR REPLACE FUNCTION
BEGIN

END;
$$
DELIMITER;

-- -------------------------------------------------------------------------------------

-- MOSTRAR TODOS

DELIMITER $$
CREATE OR REPLACE PROCEDURE mostrar_todos()
BEGIN
    
    SELECT * FROM tienda;

END; 
$$ 
DELIMITER

CALL mostrar_todos();

-- ULTIMO ID

DELIMITER $$
CREATE OR REPLACE FUNCTION ultimo_id()
                RETURNS INT(10)
BEGIN
    
    DECLARE ultimo_id INT(10) default 0;

    SELECT id INTO ultimo_id FROM talla ORDER BY id DESC LIMIT 1;
    
    RETURN ultimo_id;
END; 
$$ 
DELIMITER

SELECT ultimo_id();



DELIMITER $$
CREATE OR REPLACE FUNCTION crear_talla(descripcion VARCHAR(100))
                    RETURNS INT(10)
BEGIN

    DECLARE id_ultima_talla INT(10) default 0;
    DECLARE id_nueva_talla INT(10) default 0;
    
    SELECT ultimo_id() INTO id_ultima_talla;
    INSERT INTO talla (descripcion) values (descripcion);
    SELECT ultimo_id() INTO id_nueva_talla;
    
    IF id_nueva_talla <= id_ultima_talla THEN
        SET id_nueva_talla = 0;
    END IF;
    
    RETURN id_nueva_talla;
    
END;
$$
DELIMITER





