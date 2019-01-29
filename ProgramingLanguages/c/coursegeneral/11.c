#include <stdio.h>

int main(void)
{
	// variables declaration
	char  jobTitle;
	int   yearsServed, noOfPublication;

	printf("Current job (Tutor-T, Nontutor-others): ");
	scanf(" %c", &jobTitle);
	printf("Years served: ");
	scanf("%d", &yearsServed);
	printf("No of publication: ");
	scanf("%d", &noOfPublication);

	if(jobTitle == 'T')
	{
		if(yearsServed > 10)
			if(noOfPublication > 12)
				printf("\nCan be promoted to a lecturer!\n");
			else
				printf("\nMRequire more publications!\n");
		else
			printf("\nRequire more service years!\n");
	}
	else
		printf("\nYou are not a Tutor!\n");

	return 0;
}
