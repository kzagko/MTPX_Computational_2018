// Function tha returns the remainder S of a poisson equation
// h is multiplied here for speed float
#include "S_Poisson.h"

float S_Poisson(float x, float y, float h)
{
    return (-10.0*h*h*(x*x+y*y+5.0));
}
