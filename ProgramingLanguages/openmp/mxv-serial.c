#include <stdio.h>
#include <stdlib.h>


void mxv( int m, int n, double * restrict a, double * restrict b, double * restrict c );


int main( int argc, char *argv[] ) {
    double *a, *b, *c;
     int i, j, m, n, k, loopLimit;


     if (argc != 4) {
         fputs( "usage: mxv-serial <loopLimit> <m> <n>", stderr );
         exit( EXIT_FAILURE );
     }


     loopLimit = (int)strtol( argv[1], NULL, 10 );
     m = (int)strtol( argv[2], NULL, 10 );
     n = (int)strtol( argv[3], NULL, 10 );


      if ( (a=(double *)malloc(m*sizeof(double))) == NULL )
          perror( "memory allocation for a" );
     if ( (b=(double *)malloc(m*n*sizeof(double))) == NULL )
          perror( "memory allocation for b" );
     if ( (c=(double *)malloc(n*sizeof(double))) == NULL )
         perror( "memory allocation for c" );


     for (j=0; j<n; j++)
         c[ j ] = 2.0;
    for (i=0; i<m; i++)
         for (j=0; j<n; j++)
             b[ i*n + j ] = i;


    for (k=0; k<loopLimit; k++)
         (void) mxv( m, n, a, b, c );


     free(a); free(b); free(c);
     return EXIT_SUCCESS;
}


void mxv( int m, int n, double * restrict a, double * restrict b, double * restrict c ) {
     int i, j;


   for (i=0; i<m; i++) {
          a[ i ] = 0.0;
          for (j=0; j<n; j++)
             a[ i ] += b[ i*n + j ] * c[ j ];
      }
 }