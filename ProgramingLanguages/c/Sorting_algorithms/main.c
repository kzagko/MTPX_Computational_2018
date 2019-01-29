#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "nrutil.h"
#include <time.h>
#include <math.h>
#include "SelectionSort.h"
#include "BubbleSort.h"
#include "InsertionSort.h"

int main(int argc, char *argv[])
{
    int j,i,*pVector,*sVector,rows,totrun;
    FILE *fSort;
    totrun = 15;//power of 2 to stop the run
    //printf("argc is %d\n",argc);
    if (argc ==2)
    {
        //printf("In loop");
        totrun = atoi(argv[1]);
    }
    fSort = fopen("SortingTimes.txt", "w");
    fprintf(fSort,"Points\t Bubble\t Insertion\t Select\n");

    for (j=1; j<=totrun; j++)
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
        memcpy(&sVector[0],&pVector[0],rows*sizeof(int));


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

        fprintf(fSort,"%d\t %f\t %f\t %f\n",rows,time_spent_Bubble,time_spent_Insertion,time_spent_Select);
        if (time_spent_Bubble > 100)
        {
            fflush(fSort);
        }
    }
    fclose(fSort);
    free_ivector(sVector,1,rows);
    return 0;
}
