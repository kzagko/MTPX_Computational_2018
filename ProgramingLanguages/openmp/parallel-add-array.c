#include <omp.h>
#include <stdio.h>

int main(){

    int A[]={1,2,3,4,5,6,7,8,9,10}, N, i,o;
    N = sizeof(A)/sizeof(int);
    int nThreads = omp_get_num_threads();

    for (o = 0; o<N; o++){
        printf("%d\n",A[o]);

    }
    #pragma omp parallel shared(A,nThreads) private(i) firstprivate(N)


    {

        int myid = omp_get_thread_num();
        int iStart = myid*N/nThreads;
        int iEnd = (myid+1)*N/nThreads;

        if(myid == nThreads-1){
            iEnd = N;
        }

        for (i=iStart; i<iEnd; i++)
        {
            A[i] +=1;
        }

    }

    for (o = 0; o<N; o++){
        printf("%d\n",A[o]);

    }




}
