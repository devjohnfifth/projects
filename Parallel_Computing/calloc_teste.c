// use calloc instead of common vectors...
// DYNAMIC VECTOR (CALLOC):
//-Declaration is done at compile time, allocation is done at runtime.
//-Size can be determined at runtime.
//-Allocated on the heap (dynamic memory).
//-Automatically initialized, all bits are set to zero.
//-Access to elements through pointers.
//-Scope can be global or local, depending on the scope of the pointer.
//-Size can be changed during the program's execution, if needed.
//-Must be explicitly deallocated using free() when no longer needed to avoid
//memory leaks. -More flexible in terms of size and memory management. STATIC
// VECTOR: -Declaration and definition are done at compile time. -Size is fixed
//and determined at compile time. -Allocated on the stack or in the static data
//section of memory. -Not automatically initialized, may contain garbage values.
//-Direct access to elements.
//-Scoped to the block where they are declared.
//-Size is fixed throughout the program's execution.
//-Memory deallocation not explicitly required, automatically deallocated when
//the block where they're defined ends. -Less flexible in terms of size and
//memory management.
#include <stdio.h>
#include <stdlib.h>

int main() {
  int i, n;
  int *a;

  printf("Number of elements to be entered:");
  scanf("%d", &n);

  a = (int *)calloc(n, sizeof(int));
  printf("Enter %d numbers:\n", n);
  for (i = 0; i < n; i++) {
    scanf("%d", &a[i]);
  }

  printf("The numbers entered are: ");
  for (i = 0; i < n; i++) {
    printf("%d ", a[i]);
  }
  free(a);

  return (0);
}
