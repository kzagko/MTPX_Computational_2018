#include "BubbleSort.h"
// function to sort an array of integers using the Bubble sort algorithm.
//pVector is a pointer to an array of integers and rows the size of the array.

void BubbleSort(int *pVector, int rows)
{
    int i,check,temp;

    check = 1;
    while (check==1)// until no swapping is done any more
    {
        check = 0;
        for (i=0; i<rows-1; i++)
        {
            if (pVector[i]>pVector[i+1]) // get the greater element
            {
                temp = pVector[i]; //temporary value
                pVector[i] = pVector[i+1];//swap
                pVector[i+1] = temp;
                check = 1; // indicate that a swapp occured
            }
        }
    }
}

