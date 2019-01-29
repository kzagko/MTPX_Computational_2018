// array of structure containing arrays
#include <stdio.h>

// declare a structure storing student's
// name and his/het marks
struct MyResult
{
	float nMarks[5];
	char nFirstName[15], nLastName[15];
}semester[2]; // array of structure

void main(void)
{
	int counter, counter1;
	float fAverage = 0.0, fTotal = 0.0;

	// loop for every semester
	for(counter1 =1;counter1 <3;counter1++)
	{
		// just some info
		printf("    [Semester %d]\n", counter1);
		// prompt user for student first name
		printf("Enter First Name : ");
		// scanf_s(" %s", &averagemarks.nFirstName, sizeof(averagemarks.nFirstName)); // secure version
		// read and store student first name
		scanf(" %s",&semester[counter1].nFirstName);
		// prompt user for student last name
		printf("Enter Last Name : ");
		// read and store student last name
		scanf(" %s",&semester[counter1].nLastName);

		// prompt student's marks for four subjects
		printf("Enter Marks for 4 Subjects : ");
		for(counter=0;counter<4;counter++)
		{
			// read and store the marks
			scanf("%f",&semester[counter1].nMarks[counter]);
			// calculate the total mark
			fTotal = fTotal + semester[counter1].nMarks[counter];
		}

		// calculate the average mark
		fAverage = fTotal/4;
		printf("\n\n[SEMESTER %d: Mark, Total and Average]\n", counter1);

		// print student's name
		printf("\nStudent Name: %s %s\n", semester[counter1].nFirstName, semester[counter1].nLastName);
		// print student's marks
		printf("Marks received: ");
		for(counter=0;counter<4;counter++)
		{
			printf(" %.2f",semester[counter1].nMarks[counter]);
		}
		// print student's total and average marks
		printf("\nTotal mark is : %.2f with an average %.2f\n",fTotal, fAverage);

		// reset for new fAverage & fTotal for new semester
		fAverage = 0.0;
		fTotal = 0.0;
		printf("\n");
	}
}
