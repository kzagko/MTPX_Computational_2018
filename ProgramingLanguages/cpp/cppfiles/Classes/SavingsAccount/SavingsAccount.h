#ifndef SAVINGSACCOUNT_H
#define SAVINGSACCOUNT_H
#include "Account.h"

class SavingsAccount: public Account
{

public:
    SavingsAccount(Person, std::string, double);
    void CalcCost();

protected:

private:

    //int NumberOfTransactions;

};

#endif // SAVINGSACCOUNT_H
