#include "Parallel_Method.h"

void Parallel_Method(double ** &t1,double** &fnp1, double** &S, double tolref, int nthreads, int R, int C)
{
    int i,j,count1,dynos;
    double tol, abssum; // Create the f array in timestep +1
    tol = 1.0; // set initial value of tollerance
    count1 = 0;
    dynos = 16; //chunck size for dynamic schedule
    std::ofstream myfile, tolfile;
    std::string filename = "Liebmann_Nthrd_";
    std::string tolfilename = "Liebmann_Nthrd_";
    filename += std::to_string(nthreads);
    filename += ".dat";
    tolfilename += std::to_string(nthreads);
    tolfilename += "_tol.dat";
    tolfile.open (tolfilename);
    myfile << "Itterations\t Tolerance\n";

    double time1 = omp_get_wtime();
    double powind = 0.0;
    double fint = round(pow(10,powind));// initial index to output in file

    while (tol > tolref)
    {
        abssum = 0.0;

        //omp_set_dynamic(0);     // Explicitly disable dynamic teams
        omp_set_num_threads(nthreads);
        #pragma omp parallel reduction(+:abssum) shared(R,C,t1,fnp1,S,dynos) private(i,j) default(none)
        {
            #pragma omp for schedule(static)
            for (i=1; i<C-1; i++)
            {
//                for (j=1; j<R-1; j++)
//                {
//                    fnp1[i][j] = 0.25*(t1[i+1][j]+t1[i-1][j]+t1[i][j+1]+t1[i][j-1]-S[i][j]);
//                    abssum +=  fabs(fnp1[i][j] - t1[i][j]);
//                }
                for (j=1; j<R-1; j+=2)
                {
                    fnp1[i][j] = 0.25*(t1[i+1][j]+t1[i-1][j]+t1[i][j+1]+t1[i][j-1]-S[i][j]);
                    fnp1[i][j+1] = 0.25*(t1[i+1][j+1]+t1[i-1][j+1]+t1[i][j+2]+t1[i][j]-S[i][j+1]);
                    abssum +=  fabs(fnp1[i][j] - t1[i][j])+fabs(fnp1[i][j+1] - t1[i][j+1]);
                }
            }

            #pragma omp for collapse(2) schedule(static)
            for (i=0; i<C; i++)
            {
                for (j=0; j<R; j++)
                {
                    t1[i][j] = fnp1[i][j];
                }
            }
        }//endparallel pragma

        tol = abssum/(1.0*((R-2)*(C-2)));
        count1++;
        if (count1 == fint)
        {
            tolfile << count1 <<"\t"<< tol <<"\n";
            powind += 0.2;//step in logscale
            fint = round(pow(10,powind));
        }

    }//end while


    time1 = omp_get_wtime() - time1;
    tolfile << count1 <<"\t"<< tol <<"\n";
    tolfile.close();

// write solution to file

    myfile.open (filename);
    myfile << "Time\t Threads\t Tolerance\t Itterations\t CentralValue\n";
    myfile << time1 <<"\t"<< nthreads <<"\t"<< tol <<"\t"<< count1 <<"\t"<< fnp1[C/2][R/2] <<"\n";

    for (j=0; j<R; j++)
    {
        myfile <<"\n";
        for (i=0; i<C; i++)
        {
            myfile << fnp1[i][j] <<" ";
        }
    }
    myfile.close();


}

