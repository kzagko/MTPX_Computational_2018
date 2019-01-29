#ifndef COMPLEX_H
#define COMPLEX_H


class Complex
{
    public:
        Complex();
        virtual ~Complex();
        Complex(double r,double i);
        double Real();
        double Imag();
        void SetReal(double);
        void SetImag(double);


    protected:

    private:
        double real;
        double imag;
};

Complex operator+(Complex a,Complex b);
Complex operator+(Complex a, double b);
Complex operator+(double a,Complex b);
Complex operator-(Complex a,Complex b);
Complex operator*(Complex a,Complex b);
std::ostream& operator<<(std::ostream& o, Complex& a);


#endif // COMPLEX_H
