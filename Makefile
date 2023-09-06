R_CFLAGS = -ggdb -Wall $(shell pkg-config --cflags libR)
R_LDFLAGS = $(shell pkg-config --libs libR) -lgfortran

CC = gcc
FC = gfortran

main:
	$(CC) $(R_CFLAGS) -c wrap.c
	$(FC) $(R_CFLAGS) -c rrandom.f90
	$(FC) $(R_CFLAGS) -c test.f90
	$(CC) $(R_CFLAGS) -o run main.c wrap.o rrandom.o test.o $(R_LDFLAGS)

run: main
	./run -q

clean:
	rm -rf *.o *.mod run
