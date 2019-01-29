// a basic pointer use
#include <stdio.h>

void main(void)
{
	// declares and initializes an int variable
	int  iNormVar = 777;
	// declare a pointer to int variable
	int  *pInteger;

	// initializes pInteger to point to iNormVar
	pInteger = &iNormVar;

	// access iNormVar directly
	printf("\nDirect access, iNormVar = %d", iNormVar);
	// and indirectly
	printf("\nIndirect access, *pInteger = %d", *pInteger);
	// display the address of iNormVar in two ways
	// you can use %p for the pointer memory address directly or
	// %0x or %0X in hexadecimal representative
	printf("\n\nThe iNormVar's address, &iNormVar = %08X", &iNormVar);
	printf("\nThe iNormVar's address, pInteger = %08X\n", pInteger);
}
