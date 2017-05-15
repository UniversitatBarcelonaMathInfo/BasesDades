.\" vim: ft=groff

.char \[phone] \f[ZD]\N'37'
.\" Union \[cu]
.\" Intersecció \[ca]
.\" Join 2A1D
.char \[puntsSuspensius] \[u2026]
.char \[join] \N'2A1D'
.char \[join2] \N'10781'
.char \[join3] \[u2A1D]

.EQ
delim $%
.EN

.TL
Ajuda Postgres
.AU
Arnau Sistach


.XS 1
Objectius
.XA 2
Altres
.XE
.PX

.NH 1
Objectius
.IP
2. Coneixer diferents Joins
.IP
Saber fer agregacions en consultes SQL
.RS
.IP
avg/max/min/sum/count/DISTINCT
.IP
GROUP BY
.IP
(HAVING condicional)
.RE
.IP
Saber gestionar els Null's
.RS
.IP
IS NULL
.IP
NULL \[==] False
.RE
.IP
4. Poder fer subconsultes
.IP
Fer anar el WITH
.RS
WITH nom_desitjat AS (\[puntsSuspensius])[,]
.RE

.FS
His a food note

.FE
End text

.DS
Literal text
Whit space is a real space
.DE

.NH 1
SQL Join

.LP
.TS
l l.
CROSS	Producte cartesia
INNER	No null per a tots
LEFT/RIGHT	External Join
FULL	External Join total
.TE

.NH 1
\('Algebra relacional

.LP
.TS
c l.
\[cu]	(\[puntsSuspensius]) UNION (\[puntsSuspensius])
\[ca]	(\[puntsSuspensius]) INTERSECT (\[puntsSuspensius])
-	(\[puntsSuspensius]) EXCEPT (\[puntsSuspensius])
.TE

.NH 1
Subconsultes

.IP
Pertenencia
.RS
.IP
Where [NOT] IN (\[puntsSuspensius])
.RE
.IP
Comparaci\('o [where | <>, <=, >=, = | some/any/all | (\[puntsSuspensius])]
.RS
.IP
.TS
c c l.
some/any	$->%	Existeix
all	$->%	Per tots
.TE
.RE
.IP
Comprovaci\('o de relacions buides [where [not] exist (\[puntsSuspensius])]
.RS
.IP
Retorna true si la subconsulta \('es no buida.
.RE
.IP
Tuplas duplicadas [where [not] unique (\[puntsSuspensius])]
.RS
.IP
???!!!
.RE

.EQ
type "binary" \(mu

e1 smallover e2
e3 over e4
.EN
sd
