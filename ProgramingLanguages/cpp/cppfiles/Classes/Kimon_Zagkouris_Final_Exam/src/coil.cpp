#include "coil.h"


coil::coil()
{
    //ctor
}

coil::~coil()
{
    //dtor
}


coil::coil(double R1,double L1)
{
    R = R1;
    L = L1;
}

double coil::getX(double w)
{
    X = w*L;
    return X;
}
