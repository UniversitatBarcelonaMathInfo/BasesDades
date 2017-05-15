# tutorial groff ms
# https://www.hactrn.net/ietf/rfcgen/textms.html
# https://www.gnu.org/software/groff/manual/groff.pdf
# https://www.gnu.org/software/groff/manual/html_node/Using-Symbols.html
# man 7 groff_char
all: Postgres.ps


Postgres.ps: Postgres.ms
	groff -p -t -e -ms Postgres.ms > Postgres.ps

Postgres:
	groff -p -t -e -ms -Z Postgres.ms | gxditview -
