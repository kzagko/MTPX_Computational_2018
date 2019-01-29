#include <stdio.h>
#include "nrutil.h"


void InsertionSort(int *pVector, int rows)
{
	int j,i,temp;


	for (i = 1; i<rows; i++){
		j = i;

		while (pVector[j] < pVector[j-1] && j>0){
			temp = pVector[j-1];
			pVector[j-1] = pVector[j];
			pVector[j] = temp;
			//printf("%d and %d \n",i,j);
			j = j-1;
		}
	}
}

