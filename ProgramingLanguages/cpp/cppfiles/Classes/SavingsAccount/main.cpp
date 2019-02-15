#include <iostream>
#include <string>
#include "Bank.h"
#include "fRand.h"

int main()
{
    std::cout << "Welcome to Happy Banking!" << std::endl;
    Bank MyBank;
    Person p1("John Doe","6958745685");
    Person p2("Jane Doe","2356985214");
    MyBank.CreateAccount(p1,"GR18969849785",200.0,1);
    MyBank.CreateAccount(p1,"GR66345434332",100.0,2);
    MyBank.CreateAccount(p2,"GR47854534345",150.0,1);
    MyBank.CreateAccount(p2,"GR45645645654",300.0,2);

    int i,jft,k;
    double ammount;
    //srand (156);
    jft = MyBank.TotSize();
    ammount = 100.0;
    for (i=0; i<10; i++)
    {
        MyBank.withdrawFromAccount("GR18969849785", fRand(1,ammount));
        MyBank.withdrawFromAccount("GR66345434332", fRand(1,ammount));
        MyBank.withdrawFromAccount("GR47854534345", fRand(1,ammount));
        MyBank.withdrawFromAccount("GR45645645654", fRand(1,ammount));
        MyBank.depositToAccount("GR18969849785", fRand(1,ammount));
        MyBank.depositToAccount("GR66345434332", fRand(1,ammount));
        MyBank.depositToAccount("GR47854534345", fRand(1,ammount));
        MyBank.depositToAccount("GR45645645654", fRand(1,ammount));

    }


    MyBank.CalculateCostOfAccount("GR18969849785");
    MyBank.CalculateCostOfAccount("GR66345434332");
    MyBank.CalculateCostOfAccount("GR47854534345");
    MyBank.CalculateCostOfAccount("GR45645645654");

    MyBank.ShowAll();


    return 0;
}
