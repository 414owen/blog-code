#include <stdbool.h>

int run_switches(char *input) {
  int res = 0;
  do {
    char c = *input++;
    switch (c) {
      case '\0':
        return res;
      case 's':
        res++;
        break;
      case 'p':
        res--;
        break;
      default:
        break;
    }
  } while (true);
}
