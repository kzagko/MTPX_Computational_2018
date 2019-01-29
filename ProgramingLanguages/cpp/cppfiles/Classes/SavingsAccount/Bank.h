#ifndef BANK_H
#define BANK_H
#include "SavingsAccount.h"
#include "CheckingAccount.h"
#include <vector>




class Bank
{
    public:
        Bank();
        virtual ~Bank();
        //void InsertAccount(SavingsAccount);
        int FindAccount(std::string IBAN);
        void CreateAccount(std::string Owner0, std::string IBAN0, double Balance0, std::string ContactPhone0, int);
        void ShowAll();

    protected:

    private:
        std::vector<Account*> accounts;
};

#endif // BANK_H
