#ifndef BANK_H
#define BANK_H
#include "SavingsAccount.h"
#include "CheckingAccount.h"
#include "Person.h"
#include <vector>




class Bank
{
public:
    Bank();
    virtual ~Bank();

    int FindAccount(std::string IBAN);
    void CreateAccount(Person, std::string IBAN0, double Balance0, int);
    void depositToAccount(std::string IBAN0,double Amount0);
    void withdrawFromAccount(std::string IBAN0,double Amount0);
    void CalculateCostOfAccount(std::string IBAN0);
    void ShowAll();
    int TotSize();

protected:

private:
    std::vector<Account*> accounts;
};

#endif // BANK_H
