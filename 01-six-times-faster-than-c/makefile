all: \
	bench-c-1-gcc \
	bench-c-1-clang \
	bench-c-2-gcc \
	bench-c-2-clang \
	bench-c-3-gcc \
	bench-c-3-clang \
	bench-x64-1 \
	bench-x64-2 \
	bench-x64-3 \
	bench-x64-4 \
	bench-x64-5 \
	bench-x64-6

bench.o: bench.c
	cc -c -O2 -march=native -g -Wall -o $@ $^

%-clang.c.o: %.c
	clang -O3 -march=native -g -Wall -c -o $@ $^

%-gcc.c.o: %.c
	gcc -O3 -march=native -g -Wall -c -o $@ $^

%.x64.o: %.x64.s
	as -o $@ $^
	strip --strip-unneeded $@

bench-c-%: bench.o loop-%.c.o
	cc -o $@ $^

bench-x64-%: bench.o loop-%.x64.o
	cc -o $@ $^
