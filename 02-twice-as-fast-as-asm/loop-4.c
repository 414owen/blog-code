#include <stdbool.h>
#include <stdint.h>

static
int to_add[256] = {
  ['s'] = 1,
  ['p'] = -1,
};

int run_switches(const uint8_t *restrict input) {
  int res = 0;
  while (true) {
    const uint64_t c = *input++;
    if (c == 0) {
      return res;
    } else {
      res += to_add[c];
    }
  }
}
