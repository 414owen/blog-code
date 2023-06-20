all: bench-c-gcc bench-c-clang bench-x64 bench-c-2-gcc bench-c-2-clang

bench.o: bench.c
	cc -c -O2 -march=native -g -Wall -o $@ $^



just-switch-2-gcc.c.o: just-switch-2.c
	gcc -O3 -march=native -g -Wall -c -o $@ $^

just-switch-2-clang.c.o: just-switch-2.c
	clang -O3 -march=native -g -Wall -c -o $@ $^

bench-c-2-gcc: bench.o just-switch-2-gcc.c.o
	gcc -O3 -march=native -g -Wall -o $@ $^

bench-c-2-clang: bench.o just-switch-2-clang.c.o
	clang -O3 -march=native -g -Wall -o $@ $^



just-switch-gcc.c.o: just-switch.c
	gcc -O3 -march=native -g -Wall -c -o $@ $^

just-switch-clang.c.o: just-switch.c
	clang -O3 -march=native -g -Wall -c -o $@ $^

bench-c-gcc: bench.o just-switch-gcc.c.o
	cc -o $@ $^

bench-c-clang: bench.o just-switch-clang.c.o
	cc -o $@ $^



just-switch.x64.o: just-switch.x64.s
	as -o $@ $^

bench-x64: bench.o just-switch.x64.o
	cc -o $@ $^
