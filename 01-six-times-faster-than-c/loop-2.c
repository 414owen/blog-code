#include <stdbool.h>

int run_switches(char *input) {
  int res = 0;
  do {
    char c = *input++;
    if (c == '\0') {
      return res;
    }
    res += c == 's' ? 1 : c == 'p' ? -1 : 0;
  } while (true);
}
