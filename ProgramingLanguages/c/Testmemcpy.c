#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "nrutil.h"



int main()
{
    int i,*pVector,*sVector,rows;
    rows = 10;

    pVector =  ivector(1,rows);
    sVector =  ivector(1,rows);
//Creating the initial random data to later sort
    for (i=0; i<rows; i++){
		pVector[i] = (int)round((99.0*rand())/RAND_MAX);
		sVector[i] = pVector[i];
		printf("%2d\t %p\t %2d\t %p\t\n",pVector[i],&pVector[i],sVector[i],&sVector[i]);
	}








}
