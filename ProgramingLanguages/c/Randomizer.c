#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

float randomizer(float, float);

int main(int argc, char **argv)
{
	int i;
	float xmin,xmax;
	time_t t;
	
	srand((unsigned) time(&t));
	printf("Enter the minimun random number \n");
	scanf("%f",&xmin);
	printf("Enter the maximun random number \n");
	scanf("%f",&xmax);
	
	for (i = 1; i < 100; i++){
		printf("%f \n",randomizer(xmin,xmax));
	}
	
	
	return 0;
}



float randomizer(float min, float max){
	float value;
	
	value = max*rand()/RAND_MAX;
	
	while (value <= min){
		value = max*rand()/RAND_MAX;
		}
	return value;
	}
