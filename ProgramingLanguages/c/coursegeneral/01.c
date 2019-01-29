#include <stdio.h>

void main(void)
{
	int iRow, jColumn;
	char chArray[3][4];

	printf("Give three 3-characters strings.\n");
	for(iRow = 0; iRow <= 2; iRow = iRow + 1)
		scanf("%s", &chArray[iRow]);
	// scanf_s("%s", &a[i], 4);
	for(iRow = 0; iRow <= 2; iRow = iRow + 1)
	{
		for(jColumn = 0; jColumn <= 3; jColumn = jColumn + 1)
			printf("chArray[%d][%d] = %c\t", iRow, jColumn, chArray[iRow][jColumn]);
		printf("\n");
	}
}