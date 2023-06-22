#include <stdbool.h>

static
int to_add[256] = {
  ['s'] = 1,
  ['p'] = -1,
};

int run_switches(char *input) {
  int res = 0;
  do {
    char c = *input++;
    if (c == '\0') {
      return res;
    }
    res += to_add[c];
  } while (true);
}
