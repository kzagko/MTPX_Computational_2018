// structure definition & declaration
#include <stdio.h>
#include <string.h>

// declare PERSON structure type
struct PERSON {
	int nAge;   // declare member types
	float fWeight;
	char chName[30];
} family_member;   // define object of type PERSON

int main(void)
{
	struct PERSON sister; // C style structure declaration
	// PERSON brother;   // C++ style structure declaration, struct keyword is optional

	// assign values to members
	sister.nAge = 20;
	// brother.nAge = 15; // C++
	sister.fWeight = 123;
	// strcpy_s(sister.chName, 11, "Mike Spoon"); // secure version
	strcpy(sister.chName, "Mike Spoon");

	printf("My name is %s\n", sister.chName);
	printf("I am %.2f pounds ", sister.fWeight);
	printf("and %d years old.\n", sister.nAge);

	return 0;
}
