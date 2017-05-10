SELECT DISTINCT first_name as Name, title
FROM books as B, authors as A
WHERE B.author_id = A.id
ORDER by first_name;
