#include "Trapezoidal.h"
#include <stdio.h>

double Trapezoidal(double st1, double end1, int npoints, int nthreads)
{
    int mod, itter, id, i, st0;
    double integrals[nthreads],hstep,SumTotal,sum1;

    mod = npoints % nthreads; //The remainder of the division that needs to be treated separatetly
    itter = (npoints-mod)/nthreads; //How many itteration each thread need to do
    hstep = (end1-st1)/npoints; //calculation step



    #pragma omp parallel private(id, st0,i,sum1) num_threads(nthreads)
    {
        id = omp_get_thread_num ();//id unique in each thread 0,1,2,..,n-1 threads
        sum1 = 0;
        st0 = id*itter;
        //end0 = (id+1)*itter;
        //printf("The variables in %d are start %5.3f end %5.3f \n",id,(st0+1)*hstep,end0*hstep);
        for (i=0; i<itter; i++)
        {
             sum1 += (integral_function((st0+i)*hstep+st1)+integral_function((st0+i+1)*hstep+st1))*hstep/2.0;
            //printf("The integral is %7.4f \n",integrals[id]);
        }
        integrals[id] = sum1;
    }


    SumTotal = 0;
    for (i=0; i<nthreads; i++)
    {
        SumTotal += integrals[i];
    }

    // Chechk if the modulo is not 0 then get the last parts in sum.
    if (mod != 0)
    {
        st0 = nthreads*itter;
        for (i=0; i<mod; i++)
        {
            SumTotal += (integral_function((st0+i)*hstep+st1)+integral_function((st0+i+1)*hstep+st1))*hstep/2.0;
        }

    }


    return SumTotal;
}
