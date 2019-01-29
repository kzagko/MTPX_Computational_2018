// demonstrates the goto statement
#include <stdio.h>

void main(void)
{
	int   nNumber;

	// starting point
start: ;
	// prompt user for integer input between 0-10
	puts("Enter a number between 0 and 10: ");
	// read the input and store at nNumber variable
	scanf("%d", &nNumber);

	// test the range
	if ((nNumber < 0) || (nNumber > 10))
		// if outside the range, jump to the starting point
		goto  start;
	// else, if the input is 0
	else if (nNumber == 0)
		// jump to location_0
		goto location_0;
	// else, if the input is 1
	else if (nNumber == 1)
		// jump to location_1
		goto location_1;
	// else, jump to location_2
	else
		goto location_2;

	//location_0 task
location_0:  ;
			 {
				 puts("location_0: You entered 0.");
			 }
			 // exit
			 goto   end;
			 // location_1 task
location_1: ;
			{
				puts("location_1: You entered 1.");
			}
			// exit
			goto  end;
			// location_2 task
location_2: ;
			{
				puts("location_2: You entered something between 2 and 10.");
			}
			// program exit
end: ;
	 {
		 puts("End of program\n");
	 }
}