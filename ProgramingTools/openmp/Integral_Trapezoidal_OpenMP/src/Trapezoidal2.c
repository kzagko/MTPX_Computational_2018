#include "Trapezoidal2.h"
#include <stdio.h>

double Trapezoidal2(double st1, double end1, int npoints, int nthreads)
{
    int i;
    double hstep,sum1;

    hstep = (end1-st1)/npoints; //calculation step

    sum1 = 0;

    #pragma omp parallel shared(st1,hstep) private(i) num_threads(nthreads) reduction(+:sum1)
    {
        #pragma omp for schedule(static)
        for (i=0; i<npoints; i++)
        {
             sum1 += (integral_function(i*hstep+st1)+integral_function((i+1)*hstep+st1))*hstep/2.0;
        }
    }


    return sum1;
}

