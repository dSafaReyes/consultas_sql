USE refugio_animales;

-- EJERCICIO 1

-- 1.- Una consulta simple sobre una tabla usando alias y seleccionando varias columnas
SELECT a.especie, a.raza, a.es_salvaje FROM animal a;
/* Esta consulta selecciona todos los registro de la columnas especie, raza y es_salvaje */

-- 2.- Una consulta con al menos tres condiciones diferentes en la cláusula WHERE
SELECT * FROM animal WHERE especie='Perro' OR raza='Labrador' AND es_domestico='1';
/* Esta consulta devuelve todas la columnas con sus respectivos registros en el caso de que se cumplan las condiciones de que la especie sea perro o la raza labrador y si es domestico */

-- 3.- Una consulta con el operador BETWEEN
SELECT * FROM cliente WHERE nombre BETWEEN 'Cristina' AND 'Jaime';
/* En este caso seleccionamos todos los clientes cuyo nombre se encuentre entre los nombre Cristina y Jaime tomando el orden alfabético */

-- 4.- Una consulta con el operador LIKE
SELECT c.nombre FROM cliente c WHERE c.nombre LIKE '_u%'; 
/* Mostramos tan solo el nombre de los clientes cuya segunda letra sea la u */

-- 5.- Una consulta con el operador IN
SELECT * FROM cliente c WHERE c.nombre IN ('Sara', 'Cristina');
/* Seleccionamos los clientes cuyo nombre tome un de los siguientes valores: Sara o Cristina */

-- 6.- Una consulta con la cláusula ORDER BY y LIMIT
SELECT id_refugio, COUNT(id) FROM mascota GROUP BY id_refugio LIMIT 2; 
/* Agrupamos las mascotas por el refugio en el que se encuentran y realizamos un conteo de su cantidad. Además, sólo mostrará los dos primeros refugios */

-- 7.- Una consulta usando GROUP BY y al menos dos funciones agregado
SELECT id_refugio, COUNT(id), SUM(m.peso) FROM mascota m GROUP BY id_refugio;
/* Agrupamos las mascotas por refugio y realizamos un conteo de la cantidad que hay en cada uno de los y sumamos el peso de las mascotas que se encuentran en dicho refugio */

-- 8.- Una consulta que contenga otra dentro de la misma
SELECT 


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- EJERCICIO 2

-- 1.- El número de razas de cada especie
SELECT especie, COUNT(a.raza) FROM animal a GROUP BY especie;

-- 2.- El número de especies salvajes
SELECT es_domestico, COUNT(especie) FROM animal a WHERE es_domestico=0 GROUP BY es_domestico; 

-- 3.- El número de especies domésticas
SELECT es_domestico, COUNT(especie) FROM animal a WHERE es_domestico=1 GROUP BY es_domestico; 

-- 4.- La media de peso de las mascotas de cada tipo de animal
SELECT id_animal, AVG(m.peso) FROM mascota m GROUP BY id_animal;

-- 5.- El número de mascotas por refugio (adoptadas y sin adoptar)
SELECT id_refugio, COUNT(id) FROM mascota GROUP BY id_refugio; 

-- 6.- El número de mascotas por refugio (sin adoptar)
SELECT m.id_refugio, COUNT(m.id) 
FROM mascota m LEFT JOIN adopcion a ON m.id=a.id_mascota
WHERE a.codigo IS null
GROUP BY m.id_refugio; 

-- 7.- El número de mascotas de cada cliente
SELECT id_cliente, COUNT(id) FROM adopcion GROUP BY id_cliente;

-- 8.- El total de adopciones de cada refugio
SELECT id_refugio, COUNT(id) FROM adopcion GROUP BY id_refugio;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 5.- El nombre de refugio y el número de mascotas por refugio (adoptadas y sin adoptar)
SELECT r.nombre, COUNT(distinct m.id) 
FROM mascota m JOIN refugio r ON m.id_refugio = r.id
GROUP BY m.id_refugio;

-- 6.- Nombre de refugio, nombre de mascota (adoptadas) y nombre de refugio, nombre de mascota (sin adoptada)
SELECT m.id_refugio, COUNT(m.id) 
FROM mascota m LEFT JOIN adopcion a ON m.id=a.id_mascota
WHERE a.codigo IS null
GROUP BY m.id_refugio; 

SELECT *
FROM mascota m JOIN adopcion a ON m.id_refugio = a.id_refugio;

SELECT m.nombre, r.nombre
FROM adopcion a JOIN mascota m ON a.

SELECT r.nombre, m.nombre, a.codigo
FROM mascota m JOIN adopcion a ON m.id=a.id_mascota
                JOIN refugio r ON m.id_refugio=r.id
WHERE a.codigo is null;

-- 7.- nombre de mascotas, nombre de cliente (propietario) (si no tiene cliente NULL)
SELECT m.nombre as nombre_mascota, c.nombre as nombre_cliente
FROM mascota m LEFT JOIN adopcion a ON m.id=a.id_mascota
                LEFT JOIN cliente c ON a.id_cliente=c.id;

-- 8.- El nombre de refugio, nº de adopciones
SELECT r.nombre, COUNT(a.id) 
FROM refugio r JOIN adopcion a ON r.id=a.id_refugio
GROUP BY a.id_refugio;



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- REALIZA CONSULTAS QUE DEVUELVAN LOS SIGUIENTES DATOS

-- Los nombres de las mascotas que tienen que recibir una vacuna. 
SELECT UNIQUE(m.id), m.nombre
FROM mascota m JOIN animal a ON m.id_animal=a.id
                JOIN vacuna_animal va ON va.id_animal=a.id
ORDER BY m.id; 

-- Los nombres de las mascotas que han recibido al menos una dosis de su vacuna.
SELECT UNIQUE(m.id), m.nombre FROM mascota m JOIN vacunacion_mascota vm ON m.id=vm.id_mascota;

-- El nombre de la mascota y el nombre de la vacuna que tiene que recibir.
SELECT UNIQUE(m.nombre), v.descripcion 
FROM mascota m JOIN vacuna_mascota vm ON m.id=vm.id_mascota
                JOIN vacuna v ON vm.id_vacuna=v.id;

-- Las mascotas que han recibido la pauta de vacunación completa de su vacuna.
SELECT 
m.nombre as nombre_mascota, 
v.descripcion as nombre_vacuna, 
v.num_dosis as dosis_totales,
(SELECT COUNT(distinct vm.id) FROM vacunacion_mascota vm 
WHERE vm.id_mascota=m.id/*1*/ GROUP BY id_mascota) as dosis_recibidas
FROM mascota m left JOIN vacuna_animal va ON va.id_animal=m.id_animal
                left JOIN vacuna v ON va.id_vacuna=v.id;






-- Mascota y nombre de la vacuna que deben recibir
select m.id, m.nombre as nombre_animal, a.especie, a.raza, v.descripcion 
FROM mascota m JOIN animal a ON m.id_animal=a.id
                JOIN vacuna_animal va ON va.id_animal=a.id
                JOIN vacuna v on v.id=va.id_vacuna;