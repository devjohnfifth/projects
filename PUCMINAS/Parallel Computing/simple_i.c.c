int main(){
    int i;

    int v[5]={[0]=1,[1]=2,[2]=3,[3]=4,[4]=5};

    int sum =0;
    #pragma omp parallel for reduction(+:sum){
        for(i=1,i<=3,i++){
            sum+=
        }
    }
};