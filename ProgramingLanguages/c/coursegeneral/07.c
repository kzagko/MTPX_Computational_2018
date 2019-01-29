#include <stdio.h>

int main(void)
{
	// variable for pass count
	int nCount = 10;

	do{
		// execute statements
		printf("Hello do-while loop pass #%d\n", nCount );
		// decrement counter
		nCount = nCount - 1;
		// test the condition, if TRUE repeat, FALSE terminates
	}while ( nCount > 0 );
	return 0;
}