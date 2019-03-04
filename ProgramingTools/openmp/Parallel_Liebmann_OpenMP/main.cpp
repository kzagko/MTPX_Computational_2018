#include <iostream>
#include "S_Poisson.h"
#include "Parallel_Method.h"

// Program to solve the Poisson Equation using the Liebmann method

using namespace std;

int main()
{
    int N,M,i,j,nthreads;
    N = 400;
    M = 400;
    nthreads = 1;
    double h, x[N], y[M], **fn, **S, tolref;
    h = 1.0/N; // same h on both axis
    tolref = 0.0000001;
    //double fn[N][M];
    //double S[N][M];
    //pfn = &fn[0][0];
    //pS = &S[0][0];
    fn = new double *[N];
    S = new double *[N];

    //initiallize data
    for (i=0; i<N; i++)
    {
        fn[i] = new double[M];
        S[i] = new double[M];
        x[i] = i*h;
        for (j=0; j<M; j++)
        {
            y[j] = j*h;
            S[i][j] = S_Poisson(x[i], y[j]);
            fn[i][j] = 0;
        }
        fn[i][M-1] = 1;
    }

    Parallel_Method(fn,h,S,tolref,nthreads,N,M);





    return 0;
}