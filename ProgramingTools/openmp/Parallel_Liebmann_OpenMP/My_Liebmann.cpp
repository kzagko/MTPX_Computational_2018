//Simple Liebmann itterative methon. All ellements refer to n time and the return refers to n+1 time for point i,j
#include "My_Liebmann.h"

double My_Liebmann(double fip1, double fim1, double fjp1, double fjm1, double h, double S)
{
    return (fip1+fim1+fjp1+fjm1-pow(h,2.0)*S)/4.0;


}
