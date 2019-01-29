




void MergeSort(int* A, int Al){

    int width,i;
    SA = ivector(1,Al);
    memcpy(&SA,&A,Al*sizeof(int));

    for (width = 1; width < Al; width = 2*width){
        i = 0;

        B = ivector(1,2*width);
        for (i = 0; i < n; i = i + 2*width){


            JoinSortArrays(SA[i],SA[i+width],width,width,B)
            memcpy(&SA[i],&B,2*width*sizeof(int));

        }



    }








}
