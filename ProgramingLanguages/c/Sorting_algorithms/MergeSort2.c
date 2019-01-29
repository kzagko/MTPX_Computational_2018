

#include <stdio.h>
#include "functions.c"
#include <math.h>


int * mergeAB(int *A, int *B,int n,int m)
{
	int *cVector,p,cA,cB,ai,bi;
	cVector = ivector(0,n+m-1);
	printf("Declared vector n+m\n");
	p = 0;
	cB = 0;
	cA = 0;
	ai = 0;
	bi = 0;
	while (bi<m)//loop over the elements of B
	{	
			
		if(B[bi]<A[ai]){
			printf("in while where B is %d and j is %d\n",B[bi],bi);
			cVector[p] = B[bi];
			p++;
			bi++;
		}
		
		else
		{
			cVector[p] = A[ai];
			p++;
			ai++;
		}
		
		if (ai == n && bi < m)
		{
			for (cB = bi; cB < m; cB++)
			{
				cVector[p] = B[cB];
				p++;
			}
			break;
		}
		if (bi == m && ai < n)
		{
			for (cA = ai; cA < n; cA++)
			{
				cVector[p] = A[cA];
				p++;
			}
			break;
		}
		
	}
		
	return cVector;	
}


void loopme(int nsets, int scale, int dim1, int dim2, int *A)
{
	int *tVector,sCheck,runs,j,k,i;
	
	tVector = ivector(0,2*scale-1);
	sCheck = 0;
	if (nsets % 2 == 0)
	{
		printf(" Nsets are even\n");
		runs = nsets/2;
		sCheck = 0;
		printf("Runs are %d \n",runs);
	}
	else
	{
		printf(" Nsets are odd\n");
		runs = (nsets-1)/2;
		printf("Runs are %d \n",runs);
		sCheck = 1;
	}
	for (j=0;j<runs-1;j++)
	{	
		printf(" Inside the for loop of j = %d \n",j);
		tVector = mergeAB(&A[2*j*scale],&A[(2*j+1)*scale],dim1,dim1);
	
		for (k=0;k<2*scale;k++)
		{
			A[2*j*scale+k] = tVector[k];
		}
	}
	if (dim1 == dim2 && sCheck == 0)
	{
		
		tVector = mergeAB(&A[2*j*scale],&A[(2*j+1)*scale],dim1,dim1);
		for (k=0;k<2*scale;k++)
		{
			A[2*j*scale+k] = tVector[k];
		}
		j++;
	}
	
	if (dim1 != dim2 && sCheck == 0)
	{
		j++;
		tVector = mergeAB(&A[2*j*scale],&A[(2*j+1)*scale],dim1,dim2);
		dim2 = dim1+dim2;
		for (k=0;k<2*scale;k++)
		{
			A[2*j*scale+k] = tVector[k];
		}
	}
	
	if (sCheck == 1)
	{	j++;
		for (k=0;k<scale;k++)
		{
		A[2*j*scale+k] = A[2*j*scale+k];
		}
		dim2 = scale;
	}
	for (i = 0; i<2*j*scale+k; i++)
	{
		printf(" the As are %2d and memory is %p\n",A[i],&A[i]);
	}
	free_ivector(tVector,0,2*scale-1);
	printf("VECTOR CLEARED!!!!!!!!!\n");
	
}



//Global variables

int *pVector,*bVector;

int main(int argc, char **argv)
{
	int rows,i,loops,nsets;
	int *tVector,scale,dim1,dim2;
	
	printf("Enter the amount of numbers to generate: ");
	scanf("%d",&rows);
	
	//Define the initial data as one vector
	pVector = ivector(0,rows-1);
	//create buffer array
	bVector = ivector(0,rows-1);
	
	//initiallize array values
	for (i=0; i<rows; i++)
	{
		pVector[i] = (int)round((99.0*rand())/RAND_MAX);
		bVector[i] = pVector[i];
		printf("%2d %p %2d\n",pVector[i],&pVector[i],bVector[i]);
	}

	loops = ceil(log(rows)/log(2));

	nsets = rows;
	//step = 1;
	dim1 = 1;
	dim2 = 1;
	//difdim = 0;
	printf("The loops are %d, the sets are %d \n",loops,nsets);
	for (i=0; i<loops; i++)
	{	
		printf("Inside the main loop for i = %d \n",i);
		nsets = ceil(rows/(2.0*(i+1)));
		scale = (int)pow(2,i);
		dim1 = scale;
		loopme(nsets,scale,dim1,dim2,bVector);
	}	

	for (i = 0; i<rows; i++)
	{
		printf(" the is are %2d and memory is %p\n",bVector[i],&bVector[i]);
	}

	return 0;
}

