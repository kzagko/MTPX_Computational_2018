// recursive function, a recursive factorial function
// the formula, n! = n*(n-1)!
#include <stdio.h>

// function prototype, receive long type, return long
long factor(long); 

int main(void)
{
	int p;

	printf("Calculating factorial using recursive function\n");
	printf("----------------------------------------------\n");
	// let do some looping for 15 numbers
	for(p = 1; p<15; p++)
		printf("%d! = %d(%d)! = %d\n", p, p, p-1, factor(p));
	return 0;
}

// recursive function definition
long factor(long number)
{
	// for starting number, that <= 1, factorial = 1
	if(number<=1)
		return 1;
	// number > 1
	else
		// return and call itself
		return (number * factor(number-1));
}
