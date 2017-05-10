CREATE DATABASE example_joins;

\connect example_joins;

CREATE TABLE "table_left" (
"id" integer NOT NULL,
"value" VARCHAR(15) NOT NULL,
Constraint "table_left_pkey" Primary Key ("id")
);

CREATE TABLE "table_right" (
"id" integer NOT NULL,
"value" VARCHAR(15) NOT NULL,
Constraint "table_right_pkey" Primary Key ("id")
);

INSERT into table_left VALUES (1,'FOX');
INSERT into table_left VALUES (2,'COP');
INSERT into table_left VALUES (3,'TAXI');
INSERT into table_left VALUES (6,'WASHINGTON');
INSERT into table_left VALUES (7,'DELL');
INSERT into table_left VALUES (5,'ARIZONA');
INSERT into table_left VALUES (4,'LINCOLN');
INSERT into table_left VALUES (10,'LUCENT');

INSERT into table_right VALUES (1,'TROT');
INSERT into table_right VALUES (2,'CAR');
INSERT into table_right VALUES (3,'CAB');
INSERT into table_right VALUES (6,'MONUMENT');
INSERT into table_right VALUES (7,'PC');
INSERT into table_right VALUES (8,'MICROSOFT');
INSERT into table_right VALUES (9,'APPLE');
INSERT into table_right VALUES (11,'SCOTCH');

-- inner join
SELECT table_left.id, table_left.value, table_right.id, table_right.value
FROM table_left INNER JOIN table_right ON table_left.id = table_right.id;

-- left join
SELECT table_left.id, table_left.value, table_right.id, table_right.value
FROM table_left LEFT JOIN table_right ON table_left.id = table_right.id;

-- right join
SELECT table_left.id, table_left.value, table_right.id, table_right.value
FROM table_left RIGHT JOIN table_right ON table_left.id = table_right.id;

-- outer join
SELECT table_left.id, table_left.value, table_right.id, table_right.value
FROM table_left FULL OUTER JOIN table_right ON table_left.id = table_right.id;

-- left excluding join
SELECT table_left.id, table_left.value, table_right.id, table_right.value
FROM table_left LEFT JOIN table_right ON table_left.id = table_right.id
WHERE table_right.id IS NULL;

-- right excluding join
SELECT table_left.id, table_left.value, table_right.id, table_right.value
FROM table_left RIGHT JOIN table_right ON table_left.id = table_right.id
WHERE table_left.id IS NULL;
