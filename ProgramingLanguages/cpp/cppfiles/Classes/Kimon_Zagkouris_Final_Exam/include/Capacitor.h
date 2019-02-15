#ifndef CAPACITOR_H
#define CAPACITOR_H
#include "CircuitElement.h"
#include "Circuit.h"

class Capacitor: public CircuitElement
{
    public:
        Capacitor();
        virtual ~Capacitor();
        Capacitor(double R,double C);
        double getX(double w);
    protected:

    private:
        double C;
};

#endif // CAPACITOR_H
