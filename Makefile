# GCC complier 
CC=gcc

# GCC complier options
	# -pedantic		Issue all the warnings demanded by strict ISO C
	# -Wall			Turns on all optional warnings which are desirable for normal code.
	# -O3			turns on all optimizations
	# -g			turns on debugging information	
	
CFLAGS= -pedantic -Wall -g 

all: src/main.c src/cgp.c src/include/cgp.h
	@$(CC) -o test src/main.c src/cgp.c src/cgp.h $(CFLAGS) 

docs: src/cgp.c src/include/cgp.h
	naturaldocs -i ./src/include -o HTML ./docs -p ./naturaldocs

so:
	@$(CC) -c -fpic src/cgp.c $(CFLAGS) 
	@gcc -shared -o libcgp.so cgp.o

dll:
	@$(CC) -c -o cgp.o src/cgp.c $(CFLAGS) 
	@gcc -o cgp.dll -s -shared cgp.o

clean:
	@rm -f cgp.o libcgp.so cgp.dll test
