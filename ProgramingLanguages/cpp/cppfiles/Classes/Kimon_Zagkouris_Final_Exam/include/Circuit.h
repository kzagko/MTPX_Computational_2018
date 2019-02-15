#ifndef CIRCUIT_H
#define CIRCUIT_H
#include <math.h>
#include <vector>
#include "CircuitElement.h"
#include "coil.h"
#include "Capacitor.h"

class Circuit
{
    public:
        Circuit();
        virtual ~Circuit();
        Circuit(double w);
        void CreateL(double, double);
        void CreateC(double,double);
        double getZ();
        double getW(double w);
    protected:

    private:
        std::vector<CircuitElement*> circuits;
        double w;
};

#endif // CIRCUIT_H
