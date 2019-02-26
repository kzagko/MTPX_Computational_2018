#include "nrutil.h"


void BubbleSort(int *pVector, int rows)
{
	int i,rows,*pVector,check,temp;

	printf("Enter the amount of numbers to generate: ");
	scanf("%d",&rows);

	pVector =  ivector(1,rows);

	//printf("%p\n",pVector);
	//printf("The random arrary\n");
	for (i=0; i<rows; i++){

		pVector[i] = (int)round((99.0*rand())/RAND_MAX);
		//printf("%2d %p\n",pVector[i],&pVector[i]);
	}

	check = 1;
	clock_t begin = clock();
	while (check==1){
		check = 0;
		for (i=0; i<rows-1; i++){
			if (pVector[i]>pVector[i+1]){
				temp = pVector[i];
				//printf("the temp is %2d %p \n",*temp,&temp);
				pVector[i] = pVector[i+1];
				pVector[i+1] = temp;
				//printf("the vector is %2d\n",pVector[i+1]);
				check = 1;
			}


		}

	}
	clock_t end = clock();
	double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
	printf("The sorted array\n");
	for (i=0; i<rows; i++){

		printf("%2d \n",pVector[i]);
	}
	printf("Total execution time %f s",time_spent);
	free_ivector(pVector,1,rows);

	return 0;
}

