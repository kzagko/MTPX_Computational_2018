#include <stdio.h>

// a function prototype
float  Convert(float); 

int  main(void)
{
  	float  TempFer;
  	float  TempCel;

  	printf("Please enter the temperature in Fahrenheit: ");
  	scanf("%f", &TempFer);
  	TempCel = Convert(TempFer);
  	printf("\n");
  	printf("%f Fahrenheit = %f Celcius\n",TempFer, TempCel);
  	return 0;
}

// a function definition
float  Convert(float  TempFer)
{
  	// return the result to the calling program
  	return ((TempFer - 32) * 5) / 9;
}
