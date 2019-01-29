#include <stdio.h>
#include "nrutil.h"


void SelectionSort(int *pVector, int rows)
{
	int i,j,temp;

	for (i=0; i<rows-1; i++){
		for (j=i+1; j<rows; j++){
			if (pVector[j]<pVector[i]){
				temp = pVector[j];
				pVector[j] = pVector[i];
				pVector[i] = temp;
			}
		}
	}
	//return &pVector;
}

