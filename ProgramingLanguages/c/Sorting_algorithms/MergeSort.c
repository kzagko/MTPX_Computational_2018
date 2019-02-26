#include "MergeSort.h"


void MergeSort(int *pVector, int rows)
{
    int start,end;
    start = 0;
    end = rows;
    //printf("%d and %d \n",start,end);
    splitter(pVector, start, end);
}

void splitter(int *a, int i, int j)
{
    // Call with α[] the arrary to be sorted and i and j the edges
    int mid;

    if(i<j) // recursively call the same function to split the array in sub arrays until unit size and sort it
    {
        mid=(i+j)/2; // find the middle and split the array in 2, carefull integer division some parts not equal.
        splitter(a,i,mid); // the left part of the array
        splitter(a,mid+1,j); // the right part
        merger(a,i,mid,mid+1,j); // call the merge function to merge the two sub arrays
    }
}

void merger(int *a, int ia, int ja, int ib, int jb)
{
    // ia and ja the boundaries of first array and ib and jb the boundaries of second
    int *t, i, j, k, nsize;
    nsize = ja+jb-ia-ib; // the size of the temporary array
    t =  ivector(1,nsize); // create temporary array to store alla the data of both arrays
    i=ia; //initiallise start of first array
    j=ib; //initiallise start of the second arrary
    k=0; // counter of the temporary array

    while(i<=ja && j<=jb)	//check until you reach the end of any of the two arrays
    {

        if(a[i]<a[j])
        {
            t[k]=a[i]; //popullate temp array with the highest element
            k++;
            i++;
        }

        else
        {
            t[k]=a[j];
            k++;
            j++;
        }
    }

    while(i<=ja) //After reaching the end check if any elements are left and copy them
    {
        t[k]=a[i];
        k++;
        i++;
    }

    while(j<=jb) //same for the other array
    {
        t[k]=a[j];
        k++;
        j++;
    }

    for(i=ia,j=0; i<=jb; i++,j++) //put elements back in the original array
    {
        a[i]=t[j];
    }
}
