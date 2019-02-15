#include "Circuit.h"

Circuit::Circuit()
{
    //ctor
}

Circuit::~Circuit()
{
    //dtor
}

Circuit::Circuit(double w1)
{
    //ctor
    w = w1;
}

void Circuit::CreateL(double R1, double L1)
{

    coil ce(R1,L1);
    CircuitElement* dca = new coil(R1,L1);
    circuits.push_back(dca);

}


void Circuit::CreateC(double R1, double C1)
{
    Capacitor cp(R1,C1);
    CircuitElement* dca = new Capacitor(R1,C1);
    circuits.push_back(dca);
}

double Circuit::getZ()
{
    int i;
    double Rtot=0.0;
    double Xtot=0.0;
    for (i=0;i<circuits.size();i++)
    {
        Rtot  += circuits[i]->getR();
        Xtot  += circuits[i]->getX(w);
    }
    return sqrt(pow(Rtot,2)+pow(Xtot,2));
}

double getW(double w)
{
    return w;
}
