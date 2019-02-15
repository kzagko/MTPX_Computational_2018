#ifndef COIL_H
#define COIL_H
#include "CircuitElement.h"
#include "Circuit.h"

class coil: public CircuitElement
{
    public:
        coil();
        virtual ~coil();
        coil(double R1, double L1);
        double getX(double w);
    protected:

    private:
        double L;
};

#endif // COIL_H
