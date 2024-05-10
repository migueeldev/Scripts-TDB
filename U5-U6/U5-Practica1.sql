-- Se creo la base de datos llamada prueba:
CREATE DATABASE prueba;
-- Se pone en uso la base de datos:
use prueba;
-- Se creo la tabla llamda dimension con la siguiente estructura:
Create table dimension(
    Altura int not null,
    tamano varchar(15) not null
);

-- Se creo el siguiente procedimiento almacenado:
DELIMITER $$
CREATE PROCEDURE Decidirdimension
(IN altura INTEGER) 
BEGIN
    DECLARE variable1 CHAR(15);
    IF altura > 10 THEN
        SET variable1 = 'grande';
    ELSE
        IF altura > 5 THEN
            SET variable1 = 'mediano';
        ELSE
            SET variable1 = 'pequeno';
        END IF; -- Agregar esta línea para cerrar el IF interno
    END IF;
    INSERT INTO dimension VALUES (altura, variable1);
END
$$
DELIMITER ;

-- Ejecutamos el procedimiento almacenado con la siguiente instruccion:
CALL Decidirdimension(5);
CALL Decidirdimension(8);
CALL Decidirdimension(25);

-- Verificamos si el procedimiento se hizo adecuadamente como se muestra:
SELECT * FROM dimension;

-- EXPLICACION DEL CODIGO: 

/* Un procedimiento almacenado es un conjunto de instrucciones SQL que se almacenan en la base de datos
y se pueden llamar varias veces.

El procedimiento almacenado Decidirdimension toma un parámetro de entrada altura de tipo INTEGER 
y determina una descripción de tamaño basada en este valor. Luego, inserta esta altura y su descripción
de tamaño en una tabla llamada dimension.

Para ser más específico:

La declaración DELIMITER $$ establece el delimitador de instrucción como $$ en lugar del punto y coma (;). 
Esto es necesario porque el procedimiento almacenado contiene puntos y comas en su interior, y se 
necesita un delimitador diferente para distinguir entre las instrucciones del procedimiento y 
el final del procedimiento.

CREATE PROCEDURE es la declaración que crea el procedimiento almacenado llamado Decidirdimension.

DECLARE se usa para declarar una variable local llamada variable1 de tipo CHAR(15).
IF altura > 10 THEN ... ELSE ... END IF es una estructura de control condicional. 
Compara el valor de altura con 10 y establece el valor de variable1 en 'grande' 
si altura es mayor que 10. Si no, entra en otro bloque de IF ELSE para comparar altura con 5 y 
establecer variable1 en 'mediano' si altura es mayor que 5. Si altura no es mayor que 5, 
variable1 se establece en 'pequeño'.

INSERT INTO dimension VALUES (altura, variable1) inserta el valor de altura y variable1 en la tabla dimension.
Entonces, este procedimiento almacenado se puede llamar desde cualquier parte del código SQL y
proporcionará una descripción de tamaño basada en el valor de altura proporcionado. 
Por ejemplo, si se llama con un valor de altura de 8, insertará el valor 8 y 'mediano' en la tabla dimension.
*/
