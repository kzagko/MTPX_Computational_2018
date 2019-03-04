// Function tha returns the remainder S of a poisson equation
#include "S_Poisson.h"

double S_Poisson(double x, double y)
{
    return (-10.0*(pow(x,2.0)+pow(y,2.0)+5.0));
}
