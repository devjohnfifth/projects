//Compiler
#include <stdio.h>

int main(){
    int a = 7;
    int b = 3;
    int c = a + b;

    if(c != 0){
        c++;
    }
    
    for (size_t i = 0; i < 10000000; i++){
        c++;
    }
    

    printf("[compiler]Hey, c = %d\n", c);

    return 0;
}