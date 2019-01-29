// nested structure
#include <stdio.h>

// declare a nested structure
struct Dumb
{
	int nNum;
	struct Dumb2
	{
		int nNum2;
	} sctVar2;
} sctVar1;

int main(void)
{
	// declare variables of type structures
	struct Dumb sctVar3;
	struct Dumb2 sctVar4;

	// access & assign values to structure members
	sctVar3.nNum = 3;
	sctVar4.nNum2 = 5;
	sctVar3.sctVar2.nNum2 = 7;

	// access & print some info
	printf("nNum, Dumb's member structure value = %d\n", sctVar3.nNum);
	printf("nNum2, Dumb2's member structure value = %d\n", sctVar4.nNum2);
	printf("nNum2, Dumb2's member structure value = %d\n", sctVar3.sctVar2.nNum2);

	return 0;
}
