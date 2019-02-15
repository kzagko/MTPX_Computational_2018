#ifndef CIRCUITELEMENT_H
#define CIRCUITELEMENT_H


class CircuitElement
{
    public:
        CircuitElement();
        virtual ~CircuitElement();
        const double Pi=3.14159265359;
        //CircuitElement(double,double,double);
        double getR();
        virtual double getX(double w);

    protected:
        double R;
        double X;
    private:
};

#endif // CIRCUITELEMENT_H
