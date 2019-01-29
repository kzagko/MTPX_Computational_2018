// using multiple return statements in a function
#include <stdio.h>

// function prototype
int larger_of(int, int);

// caller
void main(void)
{
	int x, y, z;

	puts("Enter two different integer values,");
	puts("separated by space. Then press Enter key: ");
	scanf("%d%d", &x, &y);

	// call large_of() with 2 arguments stored in x and y respectively
	z = larger_of(x, y);
	printf("\nThe larger value is %d.", z);
	printf("\n");
}

// callee
// function definition, must receive 2 arguments stored (copied)
// in a and b respectively and must return a value of type int
int larger_of(int a, int b)
{
	// return a or b
	if(a > b)
		return a;
	else
		return b;
}
