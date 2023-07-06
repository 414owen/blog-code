#include <stdbool.h>

static
int to_add[256] = {
  ['s'] = 1,
  ['p'] = -1,
};

int run_switches(const char *input) {
  int res = 0;
  while (true) {
    char c = *input++;
    if (c == '\0') {
      return res;
    } else {
      res += to_add[(int) c];
    }
  }
}
