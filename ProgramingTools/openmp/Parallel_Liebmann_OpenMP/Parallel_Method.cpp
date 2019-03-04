#include "Parallel_Method.h"

void Parallel_Method(double **fn, double h, double **S, double tolref, int nthreads, int R, int C)
{
    int i,j,myid,count1;

    //std::cout << R<<C<<std::endl;
    double fnp1[R][C]={0}, tol, abssum; // Create the f array in timestep +1
    //std::copy(&fn, &fn+R*C,&fnp1[0][0]);// Coppy fn into fnp1 to get the boundaries set
    tol = 1.0; // set initial value of tollerance
    //std::cout<< &fn<< &fn[0][1]<< &fn[0][9]<< &fn[1][0]<< std::endl;
    count1 = 0;

    //initialize

    for (i=0; i<C; i++)
    {
        fnp1[i][R-1] = 1.0;
    }



    while (tol > tolref)
    {
        abssum = 0.0;
        std::cout << tol<< " Itter "<< count1<<std::endl;
        //std::cout << tol<<" fmidup = "<< fn[C/2][R-1] <<" flup = "<< fn[0][R-1] <<" frup = "<< fn[C-1][R-1]<<std::endl;
        omp_set_dynamic(0);     // Explicitly disable dynamic teams

        #pragma omp parallel shared(R,C,fn,fnp1,h,S) private(myid,i,j) reduction(+:abssum) num_threads(nthreads)
        {
            //myid = omp_get_thread_num();
            //std::cout << "My id is "<<myid << std::endl;


            #pragma omp for collapse(2)
            for (i=1; i<C-1; i++)
            {
                for (j=1; j<R-1; j++)
                {
                    fnp1[i][j] = My_Liebmann(fn[i+1][j],fn[i-1][j],fn[i][j+1],fn[i][j-1],h,S[i][j]);
                    abssum +=  fabs(fnp1[i][j] - fn[i][j]);
                    //std::cout << "I= "<<i<<" J="<< j<<" Fnp1=" <<fnp1[i][j] <<" Fn=" <<fn[i][j] <<" Abs=" <<fabs(fn[i][j]-fnp1[i][j])<<std::endl;
                }


            }

        }
        //std::cout << fnp1[R/2][C/2] << " The sum is "<<abssum<< "\n";
        tol = abssum/(1.0*((R-2)*(C-2)));
        //td::copy(&fnp1[0][0], &fnp1[0][0]+R*C,&fn[0][0]);// Coppy fnp1 into fn to set the new itteration
        for (i=0; i<C; i++)
        {
            for (j=0; j<R; j++)
            {
                fn[i][j] = fnp1[i][j];
            }
        }
//        if (count1 == 0)
//        {
//            for (i=0;i<C;i++)
//            {
//                fn[i][R-1] = 1.0;
//            }
//        }

        count1++;

    }





}

