#include<stdio.h>

int main(void)
{
	int firstNum, secondNum;

	// prompt for 2 integers
	printf("Enter two integers separated by a space:\n");
	// read and store those integers
	scanf("%d%d",&firstNum, &secondNum);
	// compare those two integers
	// if the first number >= second number
	if ( firstNum >= secondNum )
	{
		// print this
		printf("%d is larger than or equal to %d\n", firstNum, secondNum);
	}
	else // if first number < second number
	{
		// print this
		printf("%d is smaller than %d\n", firstNum, secondNum);
	}
	return 0;
}
