#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "nrutil.h"
#include <math.h>
#include "JoinSortArrays.h"



int main()
{
    int i,*pVector,*sVector,rows,*CV;
    rows = 5;

    pVector =  ivector(1,rows);
    sVector =  ivector(1,rows);
    CV = ivector(1,2*rows);
//Creating the initial random data to later sort
    for (i=0; i<rows; i++){
		pVector[i] = (int)round((99.0*rand())/RAND_MAX);
		sVector[i] = pVector[i];
		printf("%2d\t %p\t %2d\t %p\t\n",pVector[i],&pVector[i],sVector[i],&sVector[i]);
	}
    printf("Change array\n");
    //copy the ith digits till the end

    memcpy(&sVector[2],&pVector[0],3*sizeof(int));

    for (i=0; i<rows; i++){
		printf("%2d\t %p\t %2d\t %p\t\n",pVector[i],&pVector[i],sVector[i],&sVector[i]);
	}


    //it works
    JoinSortArrays(pVector,sVector,rows,rows,CV);
    for (i=0; i<2*rows; i++){
		printf("%2d\n",CV[i]);
	}

}
