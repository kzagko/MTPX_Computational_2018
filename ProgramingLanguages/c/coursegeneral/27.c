// struct data type
#include <stdio.h>
#include <string.h>

// declare a structure with variable named EmpData
struct MyEmployee
{
    char chName[20];
    int nIdNum;
    long nDepatment;
} EmpData;

void main(void)
{
	// declare structure variable
	struct MyEmployee student, staff, academician;

	// assign values to those structures' members
	// In C cannot assign to arrays. Have to copy
	// into them with strncpy()
	// student.chName = "Mike Taylor"; // error C2106: '=' : left operand must be l-value 
	// let copy the string into the array
	strcpy(student.chName, "Mike Taylor");
	staff.nDepatment = 200;
	academician.nIdNum = 23;

	// access and print those values to standard output
	printf("The student name is %s\n", student.chName);
	printf("The staff depatment is %d\n", staff.nDepatment);
	printf("Academician id number is %d\n", academician.nIdNum);

}
