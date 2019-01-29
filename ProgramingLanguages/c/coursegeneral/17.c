// demonstrate local and global variables
#include <stdio.h>

// global to main() and demo()
int globalVar = 7;

// function prototype
void demo(void);

void main(void)
{
	// local to main()
	int x = 1, y=2;

	globalVar = globalVar++;
	printf("\nglobalVar (in main()) = %d.\n", globalVar);
	printf("Before calling function demo(), x = %d, y = %d.\n", x, y);
	demo();
	printf("After calling demo(), x = %d, y = %d.\n", x, y);
}

void demo(void)
{
	// local to demo()
	int x = 88, y = 99;

	globalVar = globalVar++;
	printf("globalVar (in  demo()) = %d.\n", globalVar);
	printf("Within demo(), x = %d, y = %d.\n", x, y);
}
