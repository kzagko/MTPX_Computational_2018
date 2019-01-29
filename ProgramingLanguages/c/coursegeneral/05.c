// finding sum of array's element
#include  <stdio.h>
// replace every nSize occurrences with 10
#define  nSize  10 

int main(void)
{
     int iCount, nSum = 0, iNum[nSize] = {6,4,2,3,5,10,12};

     for (iCount=0; iCount<nSize; iCount++)
     {
            // display the array contents
            printf("%d ",iNum[iCount]);
            // do the summing up
            nSum = nSum + iNum[iCount];
     }

     // display the sum
     printf("\nSum of %d numbers is = %d\n", iCount, nSum);
     return 0;
}