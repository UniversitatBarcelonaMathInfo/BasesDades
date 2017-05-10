------ Enunciat A.
-- Obtenir per cada autor, la quantitat de llibres publicats en cada editorial
-- author, editorial, numero-libros

------ Dades que necessitem
-- editions (book_id, publisher_id) → books (id, author_id) → author (id, first_name, last_name)
--   └→ publishers (id, name)

------ Plantejament del problema
-- El més important és l'autor, tot seguit l'editorial i finalment el nombre de llibres.
-- Com que per obtenir els authors necessitem els llibre, llavors agafem els llibres amb una prioritat equivalent a author.

SELECT
a.first_name as "first name", a.last_name as "last name", p.name as editorial,

-- GROUP BY: a.id i p.name, Distinct, perquè no volem que compti dos cops el mateix llibre.
-- Important comptar b.id i no e.book_id, perquè sinó perdem el plantejament, que els llibres tenen preferencia devant l'editorial.
-- En aquest cas, aquest canvi modifica només 3 authors: John Worsley, Mark Lutz i Tom Christiansen.
COUNT (DISTINCT b.id) as "nombre de llibres"

FROM
editions AS e

-- Prioritat d'autors sobre editorials.
RIGHT JOIN
books AS b
ON e.book_id = b.id

-- Prioritat d'autors sobre llibres.
RIGHT JOIN
authors a
ON b.author_id = a.id

-- Prioritat al que ja tenim, no afegim ni eliminem res del que ja teniem.
LEFT JOIN
publishers AS p
ON e.publisher_id = p.id

-- Relacionat per
GROUP BY
a.id, p.name
;


------ Enunciat B.
-- Obtenir el nombre de llibres que cada editorial ha publicat

------ Dades que necessitem
-- editions (book_id, publisher_id) → publishers (id, name)

------ Plantejament del problema
-- El més important és publishers. Finalment els llibres.

SELECT
p.name as editorial,

-- GROUP BY: p.id. Distinct, perquè no volem que compti dos cops el mateix llibre.
COUNT(DISTINCT e.book_id) as "nombre de llibres"

FROM
editions AS e

-- Hem dit al plantejament que publishers té preferencia devant els llibres.
RIGHT JOIN
publishers AS p
ON e.publisher_id = p.id

-- Per reunir pel id dels publisher.
GROUP BY p.id
;


------ Enunciat C.
-- Obtenir el nombre de llibres que cada autor ha publicat.

------ Dades que necessitem
-- books (id, author_id) → authors (id, first_name, last_name)

------ Plantejament del problema
-- El més important és autor. Finalment els llibres.

SELECT
a.first_name as "First name", a.last_name as "Last name",

-- No cal especificar DISTINCT, ja que sortim d'un join de b.id. Així que no podem tenim b.id repetits.
COUNT (b.id) as "Nombre de publicacions"

FROM
books as b

-- Autors té preferencia sobre llibres.
RIGHT JOIN
authors as a
ON a.id = b.author_id

-- Per reunir pel id dels autors, així podrem comptar.
GROUP BY a.id
;


------ Enunciat D.
-- Clients amb més enviaments que la mitjana de llibres enviats per client.

------ Dades que necessitem
-- shipments (id, customer_id) → customers (id, first_name, last_name)

------ Plantejament del problema
-- El més important és el client. Així podrem tenir a la llista clients que no han enviat res.
-- Com que hi ha un condicional, a més de fer anar el GROUB BY també serà indicat fer anar HAVING.

SELECT
*
--ROUND(AVG(times),2)

FROM
(
	SELECT
	c.id as it, c.first_name as fname, c.last_name as lname,

	-- Comptem els c.id, ja que són qui tenen preferencia, i al ser un join no hi ha repetits.
	COUNT (c.id) as times

	FROM shipments AS s
	RIGHT JOIN customers c ON s.customer_id = c.id

	GROUP BY c.id
) X

--GROUP BY it

;
