#include <stdbool.h>

int run_switches(char *input) {
  int res = 0;
  do {
    char c = *input++;
    /*
    switch (c) {
      case '\0':
        return res;
      case 's':
        res += 1;
        break;
      case 'p':
        res -= 1;
        break;
    }
    */
    if (c == '\0') {
      return res;
    }
    const int add = c == 's' ? 1 : c == 'p' ? -1 : 0;
    res += add;
  } while (true);
}
