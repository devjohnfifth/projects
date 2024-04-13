#include <stdio.h>
#include <omp.h>
#include <stdlib.h>

int main(){
    int i;
    #pragma omp parallel num_threads(2) firstprivate(i) 
    //#pragma omp single
    {
        int tid  = omp_get_thread_num();
        for(i=1;i<=3;i++)
        {
            printf("[PRINT1] T%d = %d \n",tid,i);
            printf("[PRINT1] T%d = %d \n",tid,i);
        }
    }
}