#include <stdio.h> 

int main(void)
{
	// declare nColour variable of type char
	char nColour;

	// give some clue to user
	printf("B-Blue, G-Green, R-Red, Y-Yellow\n");
	// prompt user for input
	printf("Enter colour initial: ");
	// read the input and store it at nColour variable
	scanf(" %c", &nColour);

	// evaluate the input and compare to the template
	switch(nColour)
	{
		// if character B
		case  'B'  :  printf("B stands for Blue colour!\n");
					// terminate switch-case
					break;
		// if character G
		case  'G'  :  printf("G stands for Green colour!\n");
					// terminate switch-case
					break;
		// if character R
		case  'R'  :  printf("R stands for Red colour!\n");
					// terminate switch-case
					break;
		// if character Y
		case  'Y'  :  {
						printf("You have chosen 'Y'\n");
						printf("Y stands for Yellow colour!\n");
					  }
					// terminate switch-case
					break;
		// if no matching
		default  :  printf("The initial not a chosen colour!\n");
	}

	return 0;
}