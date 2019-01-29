#include "nrutil.h"


void BubbleSort(int *pVector, int rows)
{
	int i,check,temp;

	check = 1;
	while (check==1){
		check = 0;
		for (i=0; i<rows-1; i++){
			if (pVector[i]>pVector[i+1]){
				temp = pVector[i];
				pVector[i] = pVector[i+1];
				pVector[i+1] = temp;
				check = 1;
			}
		}
	}
}

