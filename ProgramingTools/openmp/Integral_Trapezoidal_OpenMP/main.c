//Program to calculate integralls using openmp. The functions to be integrated is in integral_function.c file. For the Trapezoidal integral the Trapezoidal.c is used. To call this program use 4 inputs.
//e.g. : $ ./a.out start end npoints nthreads
// start : The beggining of the integral
// end : The end of the integral
// npoints : The total number of points to use for the integral
// nthreads : th number of threads to use

#include <stdio.h>
#include <stdlib.h>
#include "Trapezoidal.h"
#include "Trapezoidal2.h"

int main (int argc, char *argv[])
{
    int nthreads, npoints, chk;
    double start1,end1, Htot;

    if (argc < 6)
    {
        start1 = 1.0;
        end1 = 3.0;
        nthreads = 4;
        npoints = 100000;
        chk = 0;

    }
    else
    {
        start1 = atof(argv[1]);
        end1 = atof(argv[2]);
        nthreads = atoi(argv[4]);
        npoints = atoi(argv[3]);
        chk = atoi(argv[5]);

    }
    //printf("Storage size for int : %d \n", sizeof(int));
    //printf("Calculating the Integral between %7.4f and %7.4f \n",start1,end1);
    if (chk == 0)
    {
        Htot = Trapezoidal(start1, end1,npoints,nthreads);
    }
    else
    {
        Htot = Trapezoidal2(start1, end1,npoints,nthreads);
    }

    printf("The total Integral is %5.3f\n",Htot);
    return 0;
}
