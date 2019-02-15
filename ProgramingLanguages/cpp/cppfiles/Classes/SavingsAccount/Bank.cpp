#include "Bank.h"

Bank::Bank()
{
    //ctor
}

Bank::~Bank()
{
    //dtor
}

int Bank::FindAccount(std::string IBAN)
{
    int i;
    for(i=0; i<=accounts.size(); i++)
    {
        if(accounts[i]->getIBAN() == IBAN)
        {
            return i;
        }

    }

    return -1;
}

void Bank::CreateAccount(Person person1, std::string IBAN0, double Balance0,int type)
{
    if (type == 1) //Checking account
    {
        SavingsAccount sa(person1,IBAN0,Balance0);
        Account* dsa = new SavingsAccount(person1,IBAN0,Balance0);
        accounts.push_back(dsa);
    }

    if (type == 2) //Checking account
    {
        CheckingAccount ca(person1,IBAN0,Balance0);
        Account* dca = new CheckingAccount(person1,IBAN0,Balance0);
        accounts.push_back(dca);
    }


}


void Bank::depositToAccount(std::string IBAN0,double Amount0)
{
    int AccountIndex = FindAccount(IBAN0);
    accounts[AccountIndex]->deposit(Amount0);
}

void Bank::withdrawFromAccount(std::string IBAN0,double Amount0)
{
    int AccountIndex = FindAccount(IBAN0);
    accounts[AccountIndex]->withdraw(Amount0);

}


void Bank::ShowAll()
{
    int i;
    for(i=0; i<=accounts.size(); i++)
    {
        accounts[i]->Show();
    }
}


int Bank::TotSize()
{
    return accounts.size();
}

void Bank::CalculateCostOfAccount(std::string IBAN0)
{
    int AccountIndex = FindAccount(IBAN0);
    accounts[AccountIndex]->CalcCost();
}


