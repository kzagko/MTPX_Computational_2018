#include <stdio.h>
// the array’s size 
#define SIZE 4    

void main(void)
{
	float theScore[SIZE];
	int iIndex;

	// loop to read in the scores into the array
	printf("Enter %d floats: ", SIZE);
	for(iIndex = 0; iIndex <= (SIZE - 1); iIndex = iIndex + 1)
		scanf("%f", &theScore[iIndex]);
	// loop to write out the scores from the array
	printf("The scores in reverse order are: \n");
	for(iIndex = SIZE - 1; iIndex >= 0; iIndex = iIndex - 1)
		printf("%.2f\t", theScore[iIndex]);
	printf("\n");
}
