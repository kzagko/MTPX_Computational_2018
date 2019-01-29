#include <iostream>
#include "Complex.h"

Complex::Complex()
{
    //ctor
}

Complex::~Complex()
{
    //dtor
}

Complex::Complex(double r, double i)
{
    real = r;
    imag = i;


}

double Complex::Real()
{
    return real;
}

double Complex::Imag()
{
    return imag;
}

void Complex::SetReal(double a)
{
    real = a;
}

void Complex::SetImag(double a)
{
    imag = a;
}

Complex operator+(Complex a,Complex b)
{
    //Complex result(a.real+b.real,a.imag+b.imag);
    Complex result(a.Real()+b.Real(),a.Imag()+b.Imag());
    return result;

}

Complex operator+(Complex a,double b)
{
    //Complex result(a.real+b.real,a.imag+b.imag);
    Complex result(a.Real()+b,a.Imag());
    return result;

}

Complex operator+(double a,Complex b)
{
    //Complex result(a.real+b.real,a.imag+b.imag);
    Complex result(a+b.Real(),b.Imag());
    return result;

}

Complex operator-(Complex a,Complex b)
{
    //Complex result(a.real+b.real,a.imag+b.imag);
    Complex result(a.Real()-b.Real(),a.Imag()-b.Imag());
    return result;

}

Complex operator*(Complex a,Complex b)
{
    //Complex result(a.real+b.real,a.imag+b.imag);
    Complex result(a.Real()*b.Real()-a.Imag()*b.Imag(),a.Real()*b.Imag()+a.Imag()*b.Real());
    return result;

}

std::ostream& operator<<(std::ostream& o, Complex& a)
{
    o << "(" << a.Real() << "," << a.Imag() << ")";
    return o;

}
