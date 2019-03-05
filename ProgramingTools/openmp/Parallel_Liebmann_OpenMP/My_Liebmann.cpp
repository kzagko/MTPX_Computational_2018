//Simple Liebmann itterative methon. All ellements refer to n time and the return refers to n+1 time for point i,j
// the h is already included in the S
#include "My_Liebmann.h"

float My_Liebmann(float fip1, float fim1, float fjp1, float fjm1, float S)
{
    return (fip1+fim1+fjp1+fjm1-S)/4.0;
}
