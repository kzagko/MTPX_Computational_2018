#ifndef CHECKINGACCOUNT_H
#define CHECKINGACCOUNT_H
#include "Account.h"

class CheckingAccount : public Account
{
public:
    CheckingAccount(Person, std::string, double);
    static double CostPerTransaction;
    void CalcCost();

protected:

private:

    //int NumberOfTransactions;

};

#endif // SAVINGSACCOUNT_H

