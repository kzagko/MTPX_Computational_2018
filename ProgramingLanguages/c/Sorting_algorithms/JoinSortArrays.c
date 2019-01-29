#include <string.h>


//Sort and join the elements of two arrays A and B of sizes n
//and m into an array C that is provided of size n+m

void JoinSortArrays(int *A, int *B, int n, int m, int *C)
{
    int i,j,cij,check;
    i = 0;
    j = 0;
    check = 0;

    while (check == 0)
    {
        cij = i+j;
        if (i >m-1)
        {
            memcpy(&C[cij],&A[j],(n-j)*sizeof(int));
            check = 1;
        }
        else if (j >n-1)
        {
            memcpy(&C[cij],&B[i],(m-i)*sizeof(int));
            check = 1;
        }
        else if (B[i] > A[j])
        {
            C[cij] = A[j];
            j++;
        }
        else if (A[i] > B[j])
        {
            C[cij] = B[i];
            i++;
        }
    }

    return;
}
