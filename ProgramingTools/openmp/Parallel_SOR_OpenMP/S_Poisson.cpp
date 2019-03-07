// Function tha returns the remainder S of a poisson equation
// h is multiplied here for speed double
#include "S_Poisson.h"

double S_Poisson(double x, double y, double h)
{
    return (-10.0*h*h*(x*x+y*y+5.0));
}
