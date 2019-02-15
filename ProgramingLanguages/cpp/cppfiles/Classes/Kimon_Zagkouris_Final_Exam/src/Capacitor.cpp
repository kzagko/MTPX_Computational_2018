#include "Capacitor.h"

Capacitor::Capacitor()
{
    //ctor
}

Capacitor::~Capacitor()
{
    //dtor
}

Capacitor::Capacitor(double R1,double C1)
{
    R = R1;
    C = C1;
}
double Capacitor::getX(double w)
{
    X = -1.0*(w*C);
    return X;
}
