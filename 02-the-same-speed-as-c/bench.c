#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int run_switches(char *input);

static
const int length = 1000000; // 1 million

#define BITMASK(b) (1 << ((b) % CHAR_BIT))
#define BITSLOT(b) ((b) / CHAR_BIT)
#define BITTEST(a, b) ((a)[BITSLOT(b)] & BITMASK(b))

static
unsigned char *rand_bits(int number) {
  int num_rand_calls = number / CHAR_BIT + 1;
  unsigned char *buffer = malloc(num_rand_calls * CHAR_BIT);
  for (int i = 0; i < num_rand_calls; i++) {
    buffer[i] = rand();
  }
  return buffer;
}

int main(int argc, char **argv) {
  if (argc < 3) {
    printf("Usage: %s <iterations> <seed>\n", argv[0]);
    return 1;
  }
  const int n = atoi(argv[1]);
  const int seed = atoi(argv[2]);
  srand(seed);
  unsigned char *bits = rand_bits(length);
  char *commands = malloc(length);
  for (int i = 0; i < length - 1; i++) {
    commands[i] = BITTEST(bits, i) ? 's' : 'p';
  }
  commands[length - 1] = '\0';
  int res = 0;
  for (int i = 0; i < n; i++) {
    res += run_switches(commands);
  }
  printf("%d\n", res);
}
