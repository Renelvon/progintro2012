#Last edit: 18-Feb-2012

CC=gpc

all: cfree cformat

cfree: cfree0 cfree1
cformat: cformat0 cformat1 cformati0

cfree0: cfree0.pas
	$(CC) $^ -o $@

cfree1: cfree1.pas
	$(CC) $^ -o $@

cfree2: cfree2.pas
	$(CC) $^ -o $@

cfree3: cfree3.pas
	$(CC) $^ -o $@

cformat0: cformat0.pas
	$(CC) $^ -o $@

cformat1: cformat1.pas
	$(CC) $^ -o $@

cformati0: cformati0.pas
	$(CC) $^ -o $@


clean:
	rm -f cfree0 cfree1 cfree2 cfree3 cformat0 cformat1 cformati0
