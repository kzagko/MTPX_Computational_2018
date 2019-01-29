// anonymous structure
#include <stdio.h>
#include <string.h>

struct phone
{
	int  nAreaCode;
	long nNumber;
};

struct person
{
	char   chName[35];
	char   chGender;
	int    nAge;
	int    nWeight;
	struct phone;    // anonymous structure, no name needed
} Mike;

int main(void)
{
	// strcpy_s(Mike.chName, 12, "Mike Taylor");
	strcpy(Mike.chName, "Mike Taylor");
	Mike.chGender = 'M';
	Mike.nAge  = 34;
	Mike.nWeight = 120;
	Mike.nAreaCode = 512;
	Mike.nNumber = 1234567;

	printf("Name:\t%s\n", Mike.chName);
	printf("Gender:\t%c\n", Mike.chGender);
	printf("Age:\t%d years.\n", Mike.nAge);
	printf("Weight:\t%d pounds.\n", Mike.nWeight);
	printf("Phone number:\t%d-%d\n", Mike.nAreaCode, Mike.nNumber);

	return 0;
}
