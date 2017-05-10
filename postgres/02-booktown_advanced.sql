-- Create database and tables
CREATE DATABASE booktown_bis;

\connect booktown_bis;

CREATE TABLE "books" (
"id" integer NOT NULL,
"title" text NOT NULL,
"author_id" integer,
"subject_id" integer,
Constraint "books_id_pkey" Primary Key ("id")
);

CREATE TABLE "publishers" (
"id" integer NOT NULL,
"name" text,
"address" text,
Constraint "publishers_pkey" Primary Key ("id")
);

CREATE TABLE "authors" (
"id" integer NOT NULL,
"last_name" text,
"first_name" text,
Constraint "authors_pkey" Primary Key ("id")
);

CREATE TABLE "editions" (
  "isbn" text NOT NULL,
  "book_id" integer,
  "edition" integer,
  "publisher_id" integer,
  "publication" date,
  "type" character(1),
  CONSTRAINT "integrity" CHECK (((book_id NOTNULL) AND (edition NOTNULL))),
  Constraint "pkey" Primary Key ("isbn")
);

CREATE TABLE "shipments" (
  "id" integer DEFAULT nextval('"shipments_ship_id_seq"'::text) NOT NULL,
  "customer_id" integer,
  "isbn" text,
  "ship_date" timestamp with time zone
);

CREATE TABLE "customers" (
  "id" integer NOT NULL,
  "last_name" text,
  "first_name" text,
  Constraint "customers_pkey" Primary Key ("id")
);     


-- Inserts 
INSERT INTO authors VALUES 
	(1111, 'Denham', 'Ariel'), 
	(1212, 'Worsley', 'John'), 
	(15990, 'Bourgeois', 'Paulette'), 
	(25041, 'Bianco', 'Margery Williams'), 
	(16, 'Alcott', 'Louisa May'), 
	(4156, 'King', 'Stephen'), 
	(1866, 'Herbert', 'Frank'), 
	(1644, 'Hogarth', 'Burne'), 
	(2031, 'Brown', 'Margaret Wise'), 
	(115, 'Poe', 'Edgar Allen'), 
	(7805, 'Lutz', 'Mark'), 
	(7806, 'Christiansen', 'Tom'), 
	(1533, 'Brautigan', 'Richard'), 
	(1717, 'Brite', 'Poppy Z.'), 
	(2112, 'Gorey', 'Edward'), 
	(2001, 'Clarke', 'Arthur C.'), 
	(1213, 'Brookins', 'Andrew'), 
	(1441, 'Brown', 'John');

INSERT INTO books VALUES 
	(7808, 'The Shining', 4156, 9), 
	(4513, 'Dune', 1866, 15), 
	(4267, '2001: A Space Odyssey', 2001, 15), 
	(1608, 'The Cat in the Hat', 1809, 2), 
	(1590, 'Bartholomew and the Oobleck', 1809, 2), 
	(25908, 'Franklin in the Dark', 15990, 2), 
	(1501, 'Goodnight Moon', 2031, 2), 
	(190, 'Little Women', 16, 6), 
	(1234, 'The Velveteen Rabbit', 25041, 3), 
	(2038, 'Dynamic Anatomy', 1644, 0), 
	(156, 'The Tell-Tale Heart', 115, 9), 
	(41473, 'Programming Python', 7805, 4), 
	(41477, 'Learning Python', 7805, 4), 
	(41478, 'Perl Cookbook', 7806, 4), 
	(41472, 'Practical PostgreSQL', 1212, 4);

INSERT INTO customers VALUES 
	(107, 'Jackson', 'Annie'), 
	(112, 'Gould', 'Ed'), 
	(142, 'Allen', 'Chad'), 
	(146, 'Williams', 'James'), 
	(172, 'Brown', 'Richard'), 
	(185, 'Morrill', 'Eric'), 
	(221, 'King', 'Jenny'), 
	(270, 'Bollman', 'Julie'), 
	(388, 'Morrill', 'Royce'), 
	(409, 'Holloway', 'Christine'), 
	(430, 'Black', 'Jean'), 
	(476, 'Clark', 'James'), 
	(480, 'Thomas', 'Rich'), 
	(488, 'Young', 'Trevor'), 
	(574, 'Bennett', 'Laura'), 
	(652, 'Anderson', 'Jonathan'), 
	(655, 'Olson', 'Dave'), 
	(671, 'Brown', 'Chuck'), 
	(723, 'Eisele', 'Don'), 
	(724, 'Holloway', 'Adam'), 
	(738, 'Gould', 'Shirley'), 
	(830, 'Robertson', 'Royce'), 
	(853, 'Black', 'Wendy'), 
	(860, 'Owens', 'Tim'), 
	(880, 'Robinson', 'Tammy'), 
	(898, 'Gerdes', 'Kate'), 
	(964, 'Gould', 'Ramon'), 
	(1045, 'Owens', 'Jean'), 
	(1125, 'Bollman', 'Owen'), 
	(1149, 'Becker', 'Owen'), 
	(1123, 'Corner', 'Kathy');

INSERT INTO editions VALUES 
	('039480001X', 1608, 1, 59, '1957-03-01', 'h'), 
	('0451160916', 7808, 1, 75, '1981-08-01', 'p'), 
	('0394800753', 1590, 1, 59, '1949-03-01', 'p'), 
	('0590445065', 25908, 1, 150, '1987-03-01', 'p'), 
	('0694003611', 1501, 1, 65, '1947-03-04', 'p'), 
	('0679803335', 1234, 1, 102, '1922-01-01', 'p'), 
	('0760720002', 190, 1, 91, '1868-01-01', 'p'), 
	('0394900014', 1608, 1, 59, '1957-01-01', 'p'), 
	('0385121679', 7808, 2, 75, '1993-10-01', 'h'), 
	('1885418035', 156, 1, 163, '1995-03-28', 'p'), 
	('0929605942', 156, 2, 171, '1998-12-01', 'p'), 
	('0441172717', 4513, 2, 99, '1998-09-01', 'p'), 
	('044100590X', 4513, 3, 99, '1999-10-01', 'h'), 
	('0451457994', 4267, 3, 101, '2000-09-12', 'p'), 
	('0451198492', 4267, 3, 101, '1999-10-01', 'h'), 
	('0823015505', 2038, 1, 62, '1958-01-01', 'p'), 
	('0596000855', 41473, 2, 113, '2001-03-01', 'p');

INSERT INTO publishers VALUES 
	(150, 'Kids Can Press', 'Kids Can Press, 29 Birch Ave. Toronto, ON  M4V 1E2'), 
	(91, 'Henry Holt & Company, Inc.', 'Henry Holt & Company, Inc. 115 West 18th Street New York, NY 10011'), 
	(113, 'O''Reilly & Associates', 'O''Reilly & Associates, Inc. 101 Morris St, Sebastopol, CA 95472'), 
	(62, 'Watson-Guptill Publications', '1515 Boradway, New York, NY 10036'), 
	(105, 'Noonday Press', 'Farrar Straus & Giroux Inc, 19 Union Square W, New York, NY 10003'), 
	(99, 'Ace Books', 'The Berkley Publishing Group, Penguin Putnam Inc, 375 Hudson St, New York, NY 10014'), 
	(101, 'Roc', 'Penguin Putnam Inc, 375 Hudson St, New York, NY 10014'), 
	(163, 'Mojo Press', 'Mojo Press, PO Box 1215, Dripping Springs, TX 78720'), 
	(171, 'Books of Wonder', 'Books of Wonder, 16 W. 18th St. New York, NY, 10011'), 
	(102, 'Penguin', 'Penguin Putnam Inc, 375 Hudson St, New York, NY 10014'), 
	(75, 'Doubleday', 'Random House, Inc, 1540 Broadway, New York, NY 10036'), 
	(65, 'HarperCollins', 'HarperCollins Publishers, 10 E 53rd St, New York, NY 10022'), 
	(59, 'Random House', 'Random House, Inc, 1540 Broadway, New York, NY 10036');

INSERT INTO shipments VALUES 
	(375, 142, '039480001X', '2001-08-06 09:29:21-07'), 
	(323, 671, '0451160916', '2001-08-14 10:36:41-07'), 
	(998, 1045, '0590445065', '2001-08-12 12:09:47-07'), 
	(749, 172, '0694003611', '2001-08-11 10:52:34-07'), 
	(662, 655, '0679803335', '2001-08-09 07:30:07-07'), 
	(806, 1125, '0760720002', '2001-08-05 09:34:04-07'), 
	(102, 146, '0394900014', '2001-08-11 13:34:08-07'), 
	(813, 112, '0385121679', '2001-08-08 09:53:46-07'), 
	(652, 724, '1885418035', '2001-08-14 13:41:39-07'), 
	(599, 430, '0929605942', '2001-08-10 08:29:42-07'), 
	(969, 488, '0441172717', '2001-08-14 08:42:58-07'), 
	(433, 898, '044100590X', '2001-08-12 08:46:35-07'), 
	(660, 409, '0451457994', '2001-08-07 11:56:42-07'), 
	(310, 738, '0451198492', '2001-08-15 14:02:01-07'), 
	(510, 860, '0823015505', '2001-08-14 07:33:47-07'), 
	(997, 185, '039480001X', '2001-08-10 13:47:52-07'), 
	(999, 221, '0451160916', '2001-08-14 13:45:51-07'), 
	(56, 880, '0590445065', '2001-08-14 13:49:00-07'), 
	(72, 574, '0694003611', '2001-08-06 07:49:44-07'), 
	(146, 270, '039480001X', '2001-08-13 09:42:10-07'), 
	(981, 652, '0451160916', '2001-08-08 08:36:44-07'), 
	(95, 480, '0590445065', '2001-08-10 07:29:52-07'), 
	(593, 476, '0694003611', '2001-08-15 11:57:40-07'), 
	(977, 853, '0679803335', '2001-08-09 09:30:46-07'), 
	(117, 185, '0760720002', '2001-08-07 13:00:48-07'), 
	(406, 1123, '0394900014', '2001-08-13 09:47:04-07'), 
	(340, 1149, '0385121679', '2001-08-12 13:39:22-07'), 
	(871, 388, '1885418035', '2001-08-07 11:31:57-07'), 
	(1000, 221, '039480001X', '2001-09-14 16:46:32-07'), 
	(1001, 107, '039480001X', '2001-09-14 17:42:22-07'), 
	(754, 107, '0394800753', '2001-08-11 09:55:05-07'), 
	(458, 107, '0394800753', '2001-08-07 10:58:36-07'), 
	(189, 107, '0394800753', '2001-08-06 11:46:36-07'), 
	(720, 107, '0394800753', '2001-08-08 10:46:13-07'), 
	(1002, 107, '0394800753', '2001-09-22 11:23:28-07'), 
	(2, 107, '0394800753', '2001-09-22 20:58:56-07');
