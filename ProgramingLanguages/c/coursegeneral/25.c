 // an array structure of student record
#include <stdio.h>

struct student{
	int nIdNum, nAge;
	char chFirstName[20];
	char chLastName[20];
	char chGender;
};


void main(void)
{
	// declare an array variable of 10 element
	// of type struct student
	struct student studentRecord[10];
	int i = 0;

	// we are using stack instead of heap, so no need
	// to allocate memory 'manually' using malloc()
	printf("Key-in student data and then print\n");
	printf("----------------------------------\n");

	// prompt for two student records
	for(i=0; i<2; i++)
	{
		// read the student id number input
		printf("\nID number student #%d: ", i);
		// store the student id number
		// scanf_s("%d", &studentRecord[i].nIdNum, sizeof(&studentRecord[i].nIdNum)); // secure version
		scanf("%d", &studentRecord[i].nIdNum);
		// and so on...
		printf("First name student #%d: ", i);
		scanf(" %s", &studentRecord[i].chFirstName);
		printf("Last name student  #%d: ", i);
		scanf(" %s", &studentRecord[i].chLastName);
		printf("Gender (M or F) student #%d: ", i);
		scanf(" %c", &studentRecord[i].chGender);
		printf("Age student #%d: ", i);
		scanf("%d", &studentRecord[i].nAge);
	}

	printf("\n----------Display the data---------\n");

	// print the stored data
	for(i=0; i<2; i++)
	{
		// displaying the stored data
		printf("\nID number student  #%d: %d", i, studentRecord[i].nIdNum);
		printf("\nFirst name student #%d: %s", i, studentRecord[i].chFirstName);
		printf("\nLast name student  #%d: %s", i, studentRecord[i].chLastName);
		printf("\nGender student     #%d: %c", i, studentRecord[i].chGender);
		printf("\nAge student        #%d: %d", i, studentRecord[i].nAge);
		printf("\n");
	}

	printf("\n");
}
