#include "Bank.h"

Bank::Bank()
{
    //ctor
}

Bank::~Bank()
{
    //dtor
}

//void Bank::InsertAccount(SavingsAccount A)
//{
//    accounts.push_back(A);
//}

int Bank::FindAccount(std::string IBAN)
{
    int i;
    for(i=0;i<=accounts.size();i++)
    {
        if(accounts[i]->getIBAN() == IBAN)
        {
            return i;
        }

    }

    return -1;
}

void Bank::CreateAccount(std::string Owner0, std::string IBAN0, double Balance0, std::string ContactPhone0,int type)
{
    if (type == 1) //Checking account
    {
        CheckingAccount ca(Owner0,IBAN0,Balance0,ContactPhone0);
        Account* dca = new CheckingAccount(Owner0,IBAN0,Balance0,ContactPhone0);
        account.push_back(ca);
    }

    if (type == 2) //Checking account
    {
        SavingsAccount sa(Owner0,IBAN0,Balance0,ContactPhone0);
        Account* dsa = new SavingsAccount(Owner0,IBAN0,Balance0,ContactPhone0);
        account.push_back(sa);
    }
}
