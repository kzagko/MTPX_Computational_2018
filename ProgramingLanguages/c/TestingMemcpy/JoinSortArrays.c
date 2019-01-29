#include <string.h>
#include <stdio.h>

//Sort and join the elements of two sorted arrays A and B of sizes n
//and m into an array C that is provided of size n+m

void JoinSortArrays(int *A, int *B, int n, int m, int *C)
{
    int i,j,cij,check;

    //for (i=0; i<10; i++){
    //    printf("%d\t %d\t %d \n",A[i],B[i],C[i]);
    //}
    i = 0;
    j = 0;
    check = 0;

    while (check == 0)
    {

        cij = i+j;
        //printf("Cij is %d and A[2] is %d\n",cij,A[2]);

        if (B[i] >= A[j])
        {
            //  printf("A smaller than B, i is %d, j is %d\n",i,j);
            C[cij] = A[j];
            j++;
            cij = i+j;
        }
        else
        {
            //printf("B smaller than A, i is %d, j is %d\n",i,j);
            C[cij] = B[i];
            i++;
            cij = i+j;
        }
        if (i >m-1)
        {
            //printf("B array is over, i is %d\n",i);
            memcpy(&C[cij],&A[j],(n-j)*sizeof(int));
            check = 1;
        }
        if (j >n-1)
        {
            //printf("A array is over, j is %d, i is %d, cij is %d\n",j,i,cij);
            //printf("Block size is %d\n",(int) (m-i)*sizeof(int));
            //printf("B address of %d is %p\n",i,B[i]);
            memcpy(&C[cij],&B[i],(m-i)*sizeof(int));
            check = 1;
        }
        // getchar();
        // o=0;
        // for (o=0; o<10; o++){
        // printf("%d\t %d\t %d \n",A[o],B[o],C[o]);
        // }
    }

    return;
}
