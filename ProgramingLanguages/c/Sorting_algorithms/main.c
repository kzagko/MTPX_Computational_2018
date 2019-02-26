#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "nrutil.h"
#include <time.h>
#include <math.h>
#include "SelectionSort.h"
#include "BubbleSort.h"
#include "InsertionSort.h"
#include "MergeSort.h"

// Program to test different sorting algorithms and save their time to a text file name SortingTimes.txt
// first column has the number of integers to be sorted and then 4 columns with the times each algorithm took.
// the program can be called ./a.out arg1 arg2 this will in sequence create integer arrays of size pow(2,arg) where arg is
// incremented from arg1 to arg2.


int main(int argc, char *argv[])
{
    int j,i,*pVector,*sVector,rows,totrun,startrun;
    FILE *fSort;
    // Default values if no argument present
    startrun = 1; // the begining of the calculation power of 2
    totrun = 5;//power of 2 to stop the run
    //printf("argc is %d\n",argc);
    if (argc ==2) // if only one argument start from 1 and end at argument
    {
        //printf("In loop");
        totrun = atoi(argv[1]);
    }
    if (argc ==3) // if two argument start from arg1 and end at arg2
    {
        //printf("In loop");
        startrun = atoi(argv[1]);
        totrun = atoi(argv[2]);
    }
    fSort = fopen("SortingTimes.txt", "w");
    fprintf(fSort,"Points\t Bubble\t\t Insertion\t Select\t\t Merge\n");

    for (j=startrun; j<=totrun; j++)
    {
        //printf("Enter the amount of numbers to generate: ");
        //scanf("%d",&rows);
        printf("This is run %d of %d\n",j,totrun);
        rows = pow(2,j);
        pVector =  ivector(1,rows);
        sVector =  ivector(1,rows);
//Creating the initial random data to later sort
        for (i=0; i<rows; i++)
        {
            pVector[i] = (int)round((99.0*rand())/RAND_MAX);
            //sVector[i] = pVector[i];
            //printf("%2d %p\n",pVector[i],&pVector[i]);
        }
        memcpy(&sVector[0],&pVector[0],rows*sizeof(int)); //recopy the initial array so as to have the same random numbers to sort


        //starting the clock for the sorting
        clock_t begin = clock();
        SelectionSort(sVector,rows);//executing soort on array
        clock_t end = clock();//stop clock

        double time_spent_Select = (double)(end - begin) / CLOCKS_PER_SEC;
        printf("The total execution time for Selection sort is %f s\n",time_spent_Select);
//        for (i=0; i<rows; i++)
//        {
//            sVector[i] = pVector[i];
//        }
        memcpy(&sVector[0],&pVector[0],rows*sizeof(int));
        //starting the clock for the sorting
        begin = clock();
        BubbleSort(sVector,rows);//executing soort on array
        end = clock();//stop clock
        double time_spent_Bubble = (double)(end - begin) / CLOCKS_PER_SEC;
        printf("The total execution time for Bubble sort is %f s\n",time_spent_Bubble);
//        for (i=0; i<rows; i++) //Reinitiate sVector
//        {
//            sVector[i] = pVector[i];
//        }
        memcpy(&sVector[0],&pVector[0],rows*sizeof(int));
        //starting the clock for the sorting
        begin = clock();
        InsertionSort(sVector,rows);//executing soort on array
        end = clock();//stop clock
        double time_spent_Insertion = (double)(end - begin) / CLOCKS_PER_SEC;
        printf("The total execution time for Insertion sort is %f s\n",time_spent_Insertion);
//        for (i=0; i<rows; i++) //Reinitiate sVector
//        {
//            sVector[i] = pVector[i];
//        }
        memcpy(&sVector[0],&pVector[0],rows*sizeof(int));
        //starting the clock for the sorting
        begin = clock();
        MergeSort(sVector,rows);//executing soort on array
        end = clock();//stop clock
        double time_spent_Merge = (double)(end - begin) / CLOCKS_PER_SEC;
        printf("The total execution time for Merge sort is %f s\n",time_spent_Merge);
//        for (i=0; i<rows; i++)
//        {
//            printf("%d\n",sVector[i]);
//        }


        fprintf(fSort,"%d\t %f\t %f\t %f\t %f\n",rows,time_spent_Bubble,time_spent_Insertion,time_spent_Select,time_spent_Merge);

        if (time_spent_Bubble > 100)
        {
            fflush(fSort);//make sure to flush once in a while in case of shutdown
        }
    }
    fclose(fSort);// close file
    free_ivector(sVector,1,rows);//free vector memory
    free_ivector(pVector,1,rows);
    return 0;
}
