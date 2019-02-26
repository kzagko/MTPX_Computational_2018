#include "SelectionSort.h"
// function to sort an array of integers using the Selection sort algorithm.
//pVector is a pointer to an array of integers and rows the size of the array.


void SelectionSort(int *pVector, int rows)
{
	int i,j,temp;

	for (i=0; i<rows-1; i++)//go throw the elements of the array
	{
		for (j=i+1; j<rows; j++) // check the right part of the array after i
		{
			if (pVector[j]<pVector[i]) // check if smaller
			{
				temp = pVector[j];//swap
				pVector[j] = pVector[i];
				pVector[i] = temp;
			}
		}
	}
}

