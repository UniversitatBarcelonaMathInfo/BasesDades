-- 1. Selecciona tots els llibres de temàtica 4.
SELECT * FROM books WHERE subject_id = 4;

-- 2. Selecciona totes les editorials ubicades a Nova York 'New York'
-- https://www.postgresql.org/docs/9.3/static/functions-matching.html
SELECT * FROM publishers WHERE LOWER(address) LIKE '%new york%';
--SELECT * FROM publishers WHERE LOWER(address) SIMILAR TO '%new york%';
--SELECT * FROM publishers WHERE LOWER(address) ~ 'new york';

-- 3. Els autors on el cognom comença per la lletra 'A'
SELECT * FROM authors WHERE LOWER(last_name) ~ '^a';
-- SELECT * FROM authors WHERE LOWER(last_name) LIKE 'a%';

-- 4. Els autors amb el cognom més curt
-- !!! No m'agrada
SELECT *
FROM authors
ORDER by LENGTH(last_name) LIMIT 5;

-- 5. Ordena els llibres pel títul.
SELECT * FROM books ORDER by title;

-- 6. Selecciona els authors que es diuen John Tom Frank
SELECT * FROM authors WHERE LOWER(first_name) in ('john', 'tom', 'frank');

-- 7. Mostra el número d'editorials
SELECT COUNT(*) FROM publishers;

-- 8. Selecciona els llibres on la categoria sigui entre 2 i 6.
SELECT * FROM books WHERE subject_id BETWEEN 2 and 6;

-- 9. Selecciona els llibres amb títuls que tinguin entre 4 i 12 caràcters.
SELECT * FROM books WHERE LENGTH(title) BETWEEN 4 and 8;
