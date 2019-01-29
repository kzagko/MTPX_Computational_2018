
#include <stdio.h>
#include <math.h>

double factor(int a){
	int i;
	double b=1.0;
	for(i = 1; i<=a; i++){
		b = b*i;
		}
	return b;
	}


int main(int argc, char **argv)
{
	int nrows,i,j,fac;
	char* space = " ";
	printf("Input the maximum row number: ");
	
	if (scanf("%d", &nrows) == 1) {
		printf("\n");
    } else {
        printf("Failed to read integer.\n");
    }
	// Initialize 
	
	for(i = 0; i < nrows; i++){
		//Inside the row loop
		printf("%*s",(int)ceil((5.0*(nrows-i))/2), space);
		for (j = 0; j <= i; j++){
			//Inside the column loop
			//fac = factor(j);
			fac = round((1.0*factor(i))/(1.0*factor(j)*factor(i-j)));
			printf("%4d ",fac);
			
		}
		
		printf("\n");
		
	}



	
	return 0;
}





