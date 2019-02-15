#include <iostream>
#include <string>
#include "Circuit.h"

using namespace std;

int main()
{
    std::cout << "My Circuit" << std::endl;

    //Creat a Circuit element
    const double Pi=3.1415;
    double Z;
    double wmega = 2.0*Pi*50;
    Circuit MyCircuit(wmega);

    MyCircuit.CreateC(22,0.005);//-0.6366
    MyCircuit.CreateC(220,0.015);//-0.2122
    MyCircuit.CreateL(50,0.01);//0.098598826725
    MyCircuit.CreateL(100,0.001);//0.000493479
    Z = MyCircuit.getZ();
    std::cout << "The Total resistance is Z= " << Z << std::endl;
    return 0;
}
