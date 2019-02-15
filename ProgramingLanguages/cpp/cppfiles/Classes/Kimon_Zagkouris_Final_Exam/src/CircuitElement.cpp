#include "CircuitElement.h"

CircuitElement::CircuitElement()
{
    //ctor

}

CircuitElement::~CircuitElement()
{
    //dtor
}


double CircuitElement::getR()
{
    return R;
}

double CircuitElement::getX(double w1)
{
    return X;
}
