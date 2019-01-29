// a simple function
// for predefined printf()/scanf()function
#include <stdio.h> 

// function prototype
// receives int type and returns int type
int cube(int); 

// main() function
void  main(void)
{
	int  fInput, fAnswer;

	// some info for user
	printf("\n--Calculating cube volume--\n");
	// prompt user for input
	printf("Enter a positive integer, for cube side (meter):   ");
	// read the input and store at fInput
	scanf("%d", &fInput);
	// call cube() function, bringing an fInput argument
	// assign the returned value to fAnswer
	fAnswer  =  cube(fInput);
	// print the volume of cube returned by cube()
	printf("\nCube with side %d meter, is %d cubic meter.\n", fInput, fAnswer);
} 

// function definition, calculating cube's volume
// receive fInput (cube's side), return int type, cube's volume
int  cube(int fCubeSide)
{
	// local scope (local to this function)
	// only effective in this function 'body'
	int     fCubeVolume;

	// calculate volume
	fCubeVolume  =  fCubeSide * fCubeSide * fCubeSide;
	// return the result to caller
	return     fCubeVolume;
}
