#include <stdio.h>     

void main(void)
{
	int iIndex, iArrayX[6], iArrayY[6] = {3, 8, 2, 9, 4, 1};

	for(iIndex = 0; iIndex <= 5; iIndex = iIndex + 1)
		iArrayX[iIndex] = iArrayY[iIndex];
	for(iIndex = 0; iIndex <= 5; iIndex = iIndex + 1)
		printf("iArrayX[%d] = %d\t, iArrayY[%d] %d\n", iIndex, iArrayX[iIndex], iIndex, iArrayY[iIndex]);
}