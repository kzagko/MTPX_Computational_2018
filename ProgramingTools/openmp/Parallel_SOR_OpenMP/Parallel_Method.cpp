#include "Parallel_Method.h"

void Parallel_Method(double ** &t1,double** &fnp1, double** &S, double tolref, int nthreads, int R, int C,double w)
{
    int i,j,count1,imod;

    //double **fnp1;
    //double fnp1 [R] [C] = {0};
    //double t1 [R] [C] = {0};
    double tol, abssum; // Create the f array in timestep +1
    tol = 1.0; // set initial value of tollerance
    count1 = 0;
    std::ofstream myfile, tolfile;
    std::string filename = "SOR_Nthrd_";
    std::string tolfilename = "SOR_Nthrd_";
    filename += std::to_string(nthreads);
    filename += "_omg_";
    filename += std::to_string(w);
    filename += ".dat";
    tolfilename += std::to_string(nthreads);
    tolfilename += "_omg_";
    tolfilename += std::to_string(w);
    tolfilename += "_tol.dat";
    tolfile.open (tolfilename);
    myfile << "Itterations\t Tolerance\n";

    //initialize

//    for (i=C-1; i>-1; i--)
//    {
//        std::cout << i <<" ";
//        for (j=0; j<R; j++)
//        {
//            std::cout << t1[i][j]<<" ";
//            //t1[i][j] = fn[i][j];
//        }
//        std::cout <<"\n";
//    }
//
//    std::cin.get();
    //std::cout<<t1[1][C-1]<<" "<<t1[1][C-3]<<" "<<t1[0][C-2]<<" "<<t1[2][C-2]<<" "<<S[1][C-2]<<"\n";
    //t1[2][3]=5.6;
    //std::cout<<fnp1[2][3];
    double time1 = omp_get_wtime();
    double powind = 0.0;
    double fint = round(pow(10,powind));// initial index to output in file

    while (tol > tolref)
    {
        abssum = 0.0;
        //std::cout << tol<< " Itter "<< count1<<std::endl;
        //std::cout << tol<<" fmidup = "<< t1[R-1][C/2] <<" flup = "<< t1[R-1][0] <<" frup = "<< t1[R-1][C-1]<<std::endl;
        //omp_set_dynamic(0);     // Explicitly disable dynamic teams
        omp_set_num_threads(nthreads);
        // #pragma omp parallel shared(R,C,fn,fnp1,h,S) private(myid,i,j) reduction(+:abssum) num_threads(nthreads)
        //{
        //myid = omp_get_thread_num();
        //std::cout << "My id is "<<myid << std::endl;

//        #pragma omp
//        {
        #pragma omp parallel reduction(+:abssum) shared(w,R,C,t1,fnp1,S) private(i,j,imod) default(none)
        {
            #pragma omp for
            for (i=1; i<C-1; i++)
            {
                imod = i%2;//check if i is even or odd
                for (j=imod+1; j<R-1; j+=2)
                {
                    //fnp1[i][j] = My_Liebmann(t1[i+1][j],t1[i-1][j],t1[i][j+1],t1[i][j-1],S[i][j]);
                    fnp1[i][j] =(1.0-w)*t1[i][j]+ 0.25*w*(t1[i+1][j]+t1[i-1][j]+t1[i][j+1]+t1[i][j-1]-S[i][j]);
                    abssum +=  fabs(fnp1[i][j] - t1[i][j]);
                    //printf("%8.6f %8.6f %8.6f %8.6f \n",t1[i][j],fnp1[i][j],fnp1[i][j]-t1[i][j],S[i][j]);
                    //std::cout << "I= "<<i<<" J="<< j<<" Fnp1=" <<fnp1[i][j] <<" Fn=" <<t1[i][j] <<" Abs=" <<fabs(t1[i][j]-fnp1[i][j])<<std::endl;
                }


            }
            #pragma omp for
            for (i=1; i<C-1; i++)
            {
                imod = (i+1)%2;// swift the i to change the mod of the new points
                for (j=imod+1; j<R-1; j+=2)
                {
                    //fnp1[i][j] = My_Liebmann(t1[i+1][j],t1[i-1][j],t1[i][j+1],t1[i][j-1],S[i][j]);
                    fnp1[i][j] =(1.0-w)*t1[i][j]+ 0.25*w*(fnp1[i+1][j]+fnp1[i-1][j]+fnp1[i][j+1]+fnp1[i][j-1]-S[i][j]);
                    abssum +=  fabs(fnp1[i][j] - t1[i][j]);
                    //printf("%8.6f %8.6f %8.6f %8.6f \n",t1[i][j],fnp1[i][j],fnp1[i][j]-t1[i][j],S[i][j]);
                    //std::cout << "I= "<<i<<" J="<< j<<" Fnp1=" <<fnp1[i][j] <<" Fn=" <<t1[i][j] <<" Abs=" <<fabs(t1[i][j]-fnp1[i][j])<<std::endl;
                }


            }





            //std::copy(&fnp1[0][0], &fnp1[0][0]+R*C,&t1[0][0]);// Coppy fnp1 into fn to set the new itteration
            #pragma omp for
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

