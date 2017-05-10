--select * from authors;

--select author_id, COUNT(*)
--from books
--group by author_id;

--select * from books;

select author_id, count(id), publisher_id
from books
left join editions
on books.id = editions.book_id
group by author_id, publisher_id;


SELECT
--b.author_id, e.publisher_id, COUNT(DISTINCT book_id ) AS nb
a.first_name, a.last_name, p.name as editorial, COUNT(DISTINCT book_id ) as nbooks

FROM
editions AS e

RIGHT JOIN
books AS b
ON e.book_id = b.id

RIGHT JOIN
authors a
ON b.author_id = a.id

LEFT JOIN
publishers AS p
ON e.publisher_id = p.id

GROUP BY
--b.author_id, e.publisher_id;
a.first_name, a.last_name, p.name;


SELECT
p.name, COUNT(DISTINCT book_id)
FROM
editions AS e

RIGHT JOIN
publishers AS p
ON e.publisher_id = p.id

GROUP BY p.name--publisher_id !!!
;

-- C
SELECT
a.first_name, COUNT(DISTINCT b.id)

FROM
books as b

RIGHT JOIN
authors as a
ON a.id = b.author_id

GROUP BY a.first_name;

-- D. Clientes con más envios que la media de libros enviados por cliente
SELECT
s.customer_id, COUNT(s.ship_date)

FROM
shipments as s

--WHERE 
GROUP BY s.customer_id