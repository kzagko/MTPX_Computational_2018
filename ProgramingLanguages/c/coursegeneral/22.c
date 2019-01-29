// the basic use of pointers
#include <stdio.h>

int main(void)
{
	// declares an integer and two pointers variables
	int    iNum = 100, *iPointerOne, *iPointerTwo;

	// assigns iNum's address to iPointerOne pointer
	iPointerOne = &iNum;

	// assigns iPointerOne's address to iPointerTwo pointer
	iPointerTwo = iPointerOne;

	// print the current stored data which
	// pointed to by iPointerOne and iPointerTwo pointers
	printf("Pointers variables:\n");
	printf("*iPointerOne = %d\n", *iPointerOne);
	printf("*iPointerTwo = %d\n", *iPointerTwo);
	printf("\nNormal variable, iNum = %d\n", iNum);
	printf("The iNum's address is %08X\n", &iNum);
	printf("or %08X, or %08X\n", iPointerOne, iPointerTwo);

	printf("\n-Both iPointerOne and iPointerTwo,\n");
	printf("-pointers point to the same variable iNum.\n");
	printf("-That is why, they have same value, 100.\n");

	return 0;
}
