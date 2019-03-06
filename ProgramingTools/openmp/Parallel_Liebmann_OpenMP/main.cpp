#include <iostream>
#include "S_Poisson.h"
#include "Parallel_Method.h"

// Program to solve the Poisson Equation using the Liebmann method
//a.out threads M N tolerance

//////////////////////////////////////////////////////////////////////////////////////////
///// Compile flags////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
// Intel
//
// icpc -qopenmp -fast -xSSE4.2 -ipo -O3 -no-prec-div -static -qopt-prefetch
//-unroll-aggressive -m64 main.cpp Parallel_Method.cpp S_Poisson.cpp -o a_icpc_Opt.exe
//////////////////////////////////////////////////////////////
// g++
//
// g++ main.cpp Parallel_Method.cpp S_Poisson.cpp -fopenmp -lm -O3 -msse4 -mtune=native
//-march=native -funroll-loops --param max-unroll-times=4 -ffast-math -o a_g++_Opt.exe
///////////////////////////////////////////////////////////////////////////////////////////


using namespace std;

int main (int argc, char *argv[])
{

    int N,M,i,j,nthreads;
    N = 400;
    M = 400;

    float tolref = 0.0000001;
    if (argc < 2)
    {
        nthreads = 2;

    }
    else if (argc == 2)
    {
        nthreads = atoi(argv[1]);
    }
    else if (argc>2 && argc <5)
    {
        nthreads = atoi(argv[1]);
        M = atoi(argv[2]);
        N = atoi(argv[3]);
    }
    else
    {
        nthreads = atoi(argv[1]);
        tolref = atof(argv[4]);
        M = atoi(argv[2]);
        N = atoi(argv[3]);
    }




    float h, x[N], y[M], **fn, **S, **fnp1;
    h = 1.0/(N-1); // same h on both axis

    fn = new float *[N];
    fnp1 = new float *[N];
    S = new float *[N];
    int size= N*M;
    //initiallize data
    for (i=0; i<N; i++)
    {
        x[i] = i*h;
        if(i==0)
        {
            fn[i] = new float[size];
            fnp1[i] = new float[size];
            S[i] = new float[size];
        }
        else
        {
            fn[i] = &fn[0][i*M];
            fnp1[i] = &fnp1[0][i*M];
            S[i] = &S[0][i*M];;
        }

        for (j=0; j<M; j++)
        {
            y[j] = j*h;
            S[i][j] = S_Poisson(x[i], y[j], h);
            fn[i][j] = 0;
            fnp1[i][j] = 0;
        }
       }

       for (i=0; i<M; i++)
       {
         fn[i][M-1] = 1;
        fnp1[i][M-1] = 1;
       }

    Parallel_Method(fn,fnp1,S,tolref,nthreads,N,M);





    return 0;
}
