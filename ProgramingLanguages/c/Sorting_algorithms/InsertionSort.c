#include "InsertionSort.h"
//A function to sort an array of integers using the Insertion algorithm.
//pVector is a pointer to an array of integers and rows the size of the array.

void InsertionSort(int *pVector, int rows)
{
	int j,i,temp;

	for (i = 1; i<rows; i++) //loop over the array elements starting from the 2nd
	{
		j = i;

		while (pVector[j] < pVector[j-1] && j>0) // chech if smaller
		{
			temp = pVector[j-1]; //swap
			pVector[j-1] = pVector[j];
			pVector[j] = temp;
            //printf("%d and %d \n",i,j);
			j = j-1; // until no element left unchecked
		}
	}
}

