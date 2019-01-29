#include <stdio.h>

int main(void)
{
	// declare a variable to store an integer
	int nChoice;

	// prompt user for input
	printf("Enter your choice number(1..4): \n");
	// store the input at nChoice variable
	scanf("%d", &nChoice);

	// test the condition
	switch(nChoice)
	{
		// if nChoice is 1
	case  1  :  printf("Choice number 1!\n");
		// exit the switch-case
		break;
	// if nChoice is 2
	case  2  :  printf("Choice number 2!\n");
		// exit the switch-case
		break;
		// if nChoice is 3
	case  3  :  printf("Choice number 3!\n");
	// if nChoice is 4
	case  4  :  printf("Choice number 4!\n");
		// exit the switch-case
		break;
	// if no matching
	default  :  printf("Invalid choice!\n");
	}
	return 0;
}