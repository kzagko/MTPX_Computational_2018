#include <stdio.h>

int main(int argc, char **argv)
{
	
	
int year,chk,yearend,j,testyear;
chk = 0;
yearend = 2030;
int leaps[1000];

while (chk == 0){
	printf("Insert a year up to %d\n",yearend);
	scanf("%d",&year);
	if (year < yearend && year >= 0){
		chk = 1;
	}
}
j = 0;

for (testyear = 0; testyear <= year; testyear++){
/*	printf("%d ",testyear);
 */
	if (testyear % 4 == 0 && testyear % 100 != 0){
		leaps[j] = testyear;
		j = j + 1;
		printf("%d ",testyear);
	}
	else if (testyear % 400 == 0){
		leaps[j] = testyear;
		j = j + 1;
		printf("%d ",testyear);
	}

}
printf("\n Total number of leap years until %d is %d",yearend,j);	
	return 0;
}

