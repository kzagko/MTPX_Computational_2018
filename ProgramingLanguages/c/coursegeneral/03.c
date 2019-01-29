// finding the smallest number
#include <stdio.h>
// define directive
#define  nSize  10

int main(void)
{
     int iCounter;
     float  nSmall, fSmallest[nSize]={12.0,41.5,-31.2,-45.0,33.0,-21.2,-24.1,0.7,3.2,0.5};

     nSmall = fSmallest[0];
     // loop for displaying array content
     for(iCounter=0; iCounter<nSize; iCounter++)
         printf("%.2f ",fSmallest[iCounter]);
     // another loop do the array element comparing
     for(iCounter=1; iCounter<nSize; iCounter++)   // check until condition iCounter = nSize
     {
            if(nSmall > fSmallest[iCounter])
                nSmall = fSmallest[iCounter];
    }

     printf("\nSearching...\n");
     // display the result
     printf("The smallest value in the given array is %.2f\n", nSmall);

     return  0;
}