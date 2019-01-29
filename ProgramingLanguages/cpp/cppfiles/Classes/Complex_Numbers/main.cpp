#include <iostream>
#include <ostream>
#include "Complex.h"


int main()
{
    Complex C,D,E,F,G;
    Complex A(1.0,3.0);
    Complex B(2.0,4.0);
    std::cout << A << B <<std::endl;
    C = A+B;
    std::cout << C <<std::endl;
    D = A-B;
    std::cout << D <<std::endl;
    E = A*B;
    std::cout << E <<std::endl;
    F = A+5.0;
    std::cout << F <<std::endl;
    G = 5.0+A;
    std::cout << G <<std::endl;
    return 0;
}
