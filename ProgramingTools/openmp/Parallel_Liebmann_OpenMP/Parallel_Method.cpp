#include "Parallel_Method.h"

void Parallel_Method(float **fn, float **S, float tolref, int nthreads, int R, int C)
{
    int i,j,count1;

    //std::cout << R<<C<<std::endl;
    float fnp1[R][C]={0}, t1[R][C]={0}, tol, abssum; // Create the f array in timestep +1
    //std::copy(&fn, &fn+R*C,&fnp1[0][0]);// Coppy fn into fnp1 to get the boundaries set
    tol = 1.0; // set initial value of tollerance
    //std::cout<< &fn<< &fn[0][1]<< &fn[0][9]<< &fn[1][0]<< std::endl;
    count1 = 0;

    //initialize

    for (i=0; i<C; i++)
    {
        for (j=0; j<R; j++)
        {
            fnp1[i][j] = fn[i][j];
            t1[i][j] = fn[i][j];
            }
    }


	float time1 = omp_get_wtime();

    while (tol > tolref)
    {
        abssum = 0.0;
        //std::cout << tol<< " Itter "<< count1<<std::endl;
        //std::cout << tol<<" fmidup = "<< fn[C/2][R-1] <<" flup = "<< fn[0][R-1] <<" frup = "<< fn[C-1][R-1]<<std::endl;
        //omp_set_dynamic(0);     // Explicitly disable dynamic teams
        omp_set_num_threads(nthreads);
       // #pragma omp parallel shared(R,C,fn,fnp1,h,S) private(myid,i,j) reduction(+:abssum) num_threads(nthreads)
        //{
            //myid = omp_get_thread_num();
            //std::cout << "My id is "<<myid << std::endl;


            #pragma omp parallel for shared(R,C,t1,fnp1,S) private(i,j) reduction(+:abssum) schedule(static) default(none)
            for (i=1; i<C-1; i++)
            {
                for (j=1; j<R-1; j++)
                {
                    fnp1[i][j] = My_Liebmann(t1[i+1][j],t1[i-1][j],t1[i][j+1],t1[i][j-1],S[i][j]);
                    abssum +=  fabs(fnp1[i][j] - t1[i][j]);
                    //std::cout << "I= "<<i<<" J="<< j<<" Fnp1=" <<fnp1[i][j] <<" Fn=" <<fn[i][j] <<" Abs=" <<fabs(fn[i][j]-fnp1[i][j])<<std::endl;
                }


            }

        //}
        //std::cout << fnp1[R/2][C/2] << " The sum is "<<abssum<< "\n";
        tol = abssum/(1.0*((R-2)*(C-2)));
        std::copy(&fnp1[0][0], &fnp1[0][0]+R*C,&t1[0][0]);// Coppy fnp1 into fn to set the new itteration
//        for (i=0; i<C; i++)
//        {
//            for (j=0; j<R; j++)
//            {
//                t1[i][j] = fnp1[i][j];
//            }
//        }
//        if (count1 == 0)
//        {
//            for (i=0;i<C;i++)
//            {
//                fn[i][R-1] = 1.0;
//            }
//        }

        count1++;

    }


	time1 = omp_get_wtime() - time1;

// write solution to file
std::ofstream myfile;
std::string filename = "Liebmann_Nthrd_";
filename += std::to_string(nthreads);
filename += ".dat";
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

