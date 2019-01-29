

#include <stdio.h>

int main(int argc, char **argv)
{
	
int numpepl, i;
printf("Input the total number of humans");
scanf("%d",&numpepl);
float age[numpepl];

for (i=0; i<numpepl; i++) {
	printf("Enter age: ");
	scanf("%f",&age[i]);	
}	

int juniors = 0;
int elements = 0;
int adults = 0;
int pension = 0;
int overs = 0;

	for (i=0; i<numpepl; i++){
		
		if (age[i] <= 5){
			juniors = juniors + 1;
		}
		else if (age[i] > 5 && age[i] <18 ){
			elements = elements + 1;
		}
		
		else if (age[i] >= 100){
			overs = overs + 1;
		}
		
		else if (age[i] >= 65){
			pension = pension + 1;
		}
		else {
			adults = adults + 1;
		}
		
	}
	
adults = adults + overs + pension;
pension = pension + overs;
	
float per_jun, per_ele, per_adl, per_pen, per_ovr;
	
per_jun = (100.0)*juniors/numpepl;
per_ele = (100.0)*elements/numpepl;
per_adl = (100.0)*adults/numpepl;
per_pen = (100.0)*pension/numpepl;
per_ovr = (100.0)*overs/numpepl;
	
	
	
	
printf("The numeber of kids is %d and the percentage is %.2f %% \n", juniors, per_jun);
printf("The numeber of students is %d and the percentage is %.2f %% \n", elements, per_ele);
printf("The numeber of adults is %d and the percentage is %.2f %% \n", adults, per_adl);
printf("The numeber of pensioners is %d and the percentage is %.2f %% \n", pension, per_pen);
printf("The numeber of centenarians is %d and the percentage is %.2f %% \n", overs, per_ovr);
		
	
	return 0;
}

