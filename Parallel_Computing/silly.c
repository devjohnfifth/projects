#include "stdio.h"
#include <stdlib.h>

int main() {
  int i, j, n = 10000;

  int *in = (int *)calloc(n, sizeof(int));
  int *pos = (int *)calloc(n, sizeof(int));
  int *out = (int *)calloc(n, sizeof(int));

  for (i = 0; i < n; i++) {
    in[i] = n - i;
  }

#pragma omp parallel for private(j)
  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++) {
      if (in[i] >= in[j]) {
#pragma omp atomic // use critical only if the region of code be bigger than
                   // O(N), IF THE GRANULATION IS LOW
        pos[j]++;
      }
    }
  }

  for (;;) {
  }

  for (;;) {
  }

  return 0;
}
