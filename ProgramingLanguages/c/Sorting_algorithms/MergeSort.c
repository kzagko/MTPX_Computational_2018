

#include <stdio.h>
#include "functions.c"
#include <math.h>
///// this code is wrong!!!!!!!

int * mergeAB(int *A, int *B,int n,int m){
	int *cVector,ia,ja,k,p,cA;
	cVector = ivector(0,n+m-1);
	printf("Declared vector n+m\n");
	p = 0;
	cA = 0;
	k = 0;
	for (ia=0; ia<m; ia++){//loop over the elements of B
		ja=n;
		printf("J outside while loop is %d\n",ja);
		while(B[ia]<A[ja-1] && ja>0){
			printf("in while where B is %d and j is %d\n",B[ia],ja);
			ja--;
		}
		printf("i %d j %d cA %d k %d p %d\n",ia,ja,cA,k,p);
		if (ja == 0){
			cVector[p] = B[ia];
			printf("The smallest element %d \n",B[ia]);
			p++;
		}	
		else{
			for (k=cA;k<ja;k++){
				cVector[p] = A[k];
				printf("assigning %d at %d\n",A[k],p);
				p++;
			}
			cA = ja;
			if (cA == n){
				printf("Reached final elements\n");
				for (k = ia; k < m; k++){
					cVector[p] = B[k];
					p++;
				}
				break;
			}
			else{
				cVector[p] = B[ia];
				p++;
			}
		}
		printf("i %d j %d cA %d k %d p %d\n",ia,ja,cA,k,p);
	}
	while (ja < n){
		cVector[p] = A[ja];
		p++;
		ja++;
	}
	
	return cVector;	
}

void loopme(int nsets, int scale, int *bVector,dim1,dim2,difdim)
{
	//difdim variable set to 0 if the dimensions of the two last sets are the same
	
	runs = nsets/(2*scale);
	printf("runs are %d\n",runs);
	tVector = ivector(0,2*scale-1);
	//tVector[0] = 5;
	//printf("tvector 1 before assignment %d\n",tVector[0]);
	for (j=0;j<runs;j++)
	{
		printf("j is %d\n",j);
		printf("bVector1 is %d bVector2 is %d and scale is %d\n",bVector[2*j*scale],bVector[(2*j+1)*scale],scale);
		if (j== runs-1 && difdim !=0)
		{
			tVector = mergeAB(&bVector[2*j*scale],&bVector[(2*j+1)*scale],dim1,dim2);
		}
		else
		{
			tVector = mergeAB(&bVector[2*j*scale],&bVector[(2*j+1)*scale],dim1,dim1);
		}
		printf("tVector1 is %d tVector2 is %d\n",tVector[0],tVector[scale]);
		for (k=0;k<2*scale;k++)
		{
			bVector[2*j*scale+k] = tVector[k];
		}
		//for (l = 0; l<rows; l++)
		//{
		//printf(" the Vs are %2d and memory is %p\n",bVector[l],&bVector[l]);
		//}
			}
		free_ivector(tVector,0,2*scale-1);
		printf("VECTOR CLEARED!!!!!!!!!\n");
}










int main(int argc, char **argv)
{
	int rows,*pVector,i,*test,*myarr,loops,nsets,step,*bVector,runs;
	int *tVector,scale,k,j,l;
	
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
	
	
	//printf("before setting second ivector\n");
	//test = ivector(0,7);
	//test[0] = 1;
	//test[1] = 2;
	//test[2] = 8;
	//test[3] = 9;
	//test[4] = 3;
	//test[5] = 4;
	//test[6] = 12;
	//test[7] = 16;
	//test[0] = 78;
	//test[1] = 83;
	//test[2] = 39;
	//test[3] = 79;
	////printf("Before calling function\n");
	//myarr = mergeAB(&test[0],&test[2],2,2);

	//for (i = 0; i<4; i++)
	//{
	//	printf(" the is are %2d and memory is %p\n",myarr[i],&myarr[i]);
	//}
	
	
	//check if total rows is even or odd and choose loop size
	loops = ceil(log(rows)/log(2));
	nsets = rows;
	step = 1;
	dim1 = rows;
	dim2 = rows;
	difdim = 0;
	for (i=0;i<loops;i++)
	{
		
		scale = (int)pow((double)2,(double)i);
		printf("I is %d and scale is %d\n",i,scale);
		nsets = floor(1.0*(rows+1)/2);
		printf("Nsets are %d\n",nsets);
		if (nsets % 2 == 0)
		{
			loopme(nsets, scale, &bVector,dim1,dim2,difdim);
			
			//runs = nsets/(2*scale);
			//printf("runs are %d\n",runs);
			//tVector = ivector(0,2*scale-1);
			////tVector[0] = 5;
			////printf("tvector 1 before assignment %d\n",tVector[0]);
			//for (j=0;j<runs;j++)
			//{
				//printf("j is %d\n",j);
				//printf("bVector1 is %d bVector2 is %d and scale is %d\n",bVector[2*j*scale],bVector[(2*j+1)*scale],scale);
				//tVector = mergeAB(&bVector[2*j*scale],&bVector[(2*j+1)*scale],scale,scale);
				
				//printf("tVector1 is %d tVector2 is %d\n",tVector[0],tVector[scale]);
				//for (k=0;k<2*scale;k++)
				//{
					//bVector[2*j*scale+k] = tVector[k];
				//}
				////for (l = 0; l<rows; l++)
				////{
					////printf(" the Vs are %2d and memory is %p\n",bVector[l],&bVector[l]);
				////}
			//}
			//free_ivector(tVector,0,2*scale-1);
			//printf("VECTOR CLEARED!!!!!!!!!\n");	
		}
		
		else
		{
			
			loopme(nsets, scale, &bVector,dim1,dim2,difdim);
			//runs = (nsets-1)/(2*scale);
			//printf("runs are %d\n",runs);
			//tVector = ivector(0,2*scale-1);
			////tVector[0] = 5;
			////printf("tvector 1 before assignment %d\n",tVector[0]);
			//for (j=0;j<runs;j++)
			//{
				//printf("j is %d\n",j);
				//printf("bVector1 is %d bVector2 is %d and scale is %d\n",bVector[2*j*scale],bVector[(2*j+1)*scale],scale);
				//tVector = mergeAB(&bVector[2*j*scale],&bVector[(2*j+1)*scale],scale,scale);
				
				//printf("tVector1 is %d tVector2 is %d\n",tVector[0],tVector[scale]);
				//for (k=0;k<2*scale;k++)
				//{
					//bVector[2*j*scale+k] = tVector[k];
				//}
				////for (l = 0; l<rows; l++)
				////{
					////printf(" the Vs are %2d and memory is %p\n",bVector[l],&bVector[l]);
				////}
			//}
			
		//free_ivector(tVector,0,2*scale-1);
		//printf("VECTOR CLEARED!!!!!!!!!\n");
		}
		
		
		
		
		
		
		
	}	
	
	for (l = 0; l<rows; l++)
	{
		printf(" the Vs are %2d and memory is %p\n",bVector[l],&bVector[l]);
	}
	
	return 0;
}
