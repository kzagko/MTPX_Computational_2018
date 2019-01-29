// continue example
#include <stdio.h>

void main(void)
{
	// declare storage for input, an array and counter variable
	char buffer[81];
	int nCounter;

	// input and read a line of text using
	// puts() and gets() are pre defined functions in stdio.h
	puts("Enter a line of text and press Enter key,");
	puts("all the vowels will be discarded!:\n");
	gets(buffer);

	// go through the string, displaying only those
	// characters that are not lowercase vowels
	for(nCounter=0; buffer[nCounter] != '\0'; nCounter++)
	{
		// if the character is a lowercase vowel, loop back without displaying it
		if((buffer[nCounter]=='a')||(buffer[nCounter]=='e')|| (buffer[nCounter]=='i')||(buffer[nCounter]=='o')||(buffer[nCounter]=='u'))
			continue;
		// if not a vowel, display it
		putchar(buffer[nCounter]);
	}
	printf("\n");
}